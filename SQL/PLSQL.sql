-- 예약 insert때 consult_room_id 생성하는 트리거
CREATE OR REPLACE TRIGGER trg_generate_consult_room_id BEFORE
    INSERT ON tb_reservation
    FOR EACH ROW
DECLARE
    v_consult_room_id  VARCHAR2(255);
    v_pending_count    NUMBER;
    v_remain_cnt       NUMBER;
BEGIN
    v_consult_room_id := :new.user_seq
                         || '_'
                         || :new.brand_seq
                         || '_'
                         || :new.reservation_seq;

    :new.consult_room_id := v_consult_room_id;
    SELECT
        COUNT(*)
    INTO v_pending_count
    FROM
        tb_reservation
    WHERE
            reserve_status = 0
        AND reserve_date = :new.reserve_date
        AND reserve_time = :new.reserve_time;

    SELECT
        remain_cnt
    INTO v_remain_cnt
    FROM
        tb_user u
    WHERE
        user_seq = :new.user_seq;

    IF v_pending_count > 0 THEN
        raise_application_error(-20001, '이미 같은 시간 예약이 있습니다.');
    ELSIF v_remain_cnt <= 0 THEN
        raise_application_error(-20001, '이번 달 예약 가능 횟수를 모두 소진 하였습니다.');
    ELSE
        UPDATE tb_user
        SET
            remain_cnt = v_remain_cnt - 1
        WHERE
            user_seq = :new.user_seq;

    END IF;

END;
/

-- 지난 예약의 상태를 바꾸기 위한 프로시저
CREATE OR REPLACE PROCEDURE expired_reservations AS
BEGIN
    UPDATE tb_reservation
    SET
        reserve_status = 2
    WHERE
            reserve_status = 0
        AND to_date(reserve_date
                    || ' '
                    || reserve_time, 'YYYY-MM-DD HH24:MI') < current_timestamp;

END;
/

BEGIN
    dbms_scheduler.drop_job(job_name => 'ace.update_expired_reservations', defer => false, force => false);
END;
/

BEGIN
    dbms_scheduler.create_job(job_name => 'ace.update_expired_reservations', job_type => 'STORED_PROCEDURE',
                             job_action => 'ace.expired_reservations',
                             number_of_arguments => 0,
                             start_date => NULL,
                             repeat_interval => 'FREQ=MINUTELY;BYMINUTE=59, 29;BYSECOND=0',
                             end_date => NULL,
                             enabled => false,
                             auto_drop => false,
                             comments => '지난 예약 업데이트');
END;
/

-- 스케줄러 시작 명령어
BEGIN
    dbms_scheduler.enable(name => 'ace.update_expired_reservations');
END;
/

-- 스케줄러 정지 명령어
-- BEGIN
-- 	DBMS_SCHEDULER.disable(name=>'ace.update_expired_reservations', force => TRUE);
-- END;
--/

-- 매달 유저의 잔여 예약 횟수 변경 프로시져
CREATE OR REPLACE PROCEDURE reset_user_remain_cnt AS
BEGIN
    UPDATE tb_user
    SET
        remain_cnt = 10
    WHERE
        role_num = 0;

END;
/

BEGIN
    dbms_scheduler.drop_job(job_name => 'ace.update_user_remain_cnt', defer => false, force => false);
END;
/

BEGIN
    dbms_scheduler.create_job(job_name => 'ace.update_user_remain_cnt', job_type => 'STORED_PROCEDURE',
                             job_action => 'ace.reset_user_remain_cnt',
                             number_of_arguments => 0,
                             start_date => trunc(sysdate, 'MM') + INTERVAL '1' MONTH,
                             repeat_interval => 'FREQ=MONTHLY; BYMONTHDAY=1',
                             end_date => NULL,
                             enabled => false,
                             auto_drop => false,
                             comments => '예약 횟수 업데이트');
END;
/

-- 스케줄러 시작 명령어
BEGIN
    dbms_scheduler.enable(name => 'ace.update_user_remain_cnt');
END;
/

-- 스케줄러 정지 명령어
-- BEGIN
-- 	DBMS_SCHEDULER.disable(name=>'ace.update_user_remain_cnt', force => TRUE);
-- END;
--/