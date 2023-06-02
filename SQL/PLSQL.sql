-- 예약 insert때 consult_room_id 생성하는 트리거
CREATE OR REPLACE TRIGGER trg_generate_consult_room_id BEFORE
    INSERT ON tb_reservation
    FOR EACH ROW
DECLARE
    v_consult_room_id VARCHAR2(255);
BEGIN
    -- 유니크한 consult_room_id 생성
    v_consult_room_id := :new.user_seq
                         || '_'
                         || :new.brand_seq
                         || '_'
                         || :new.reservation_seq;

    -- 생성한 consult_room_id를 새로운 레코드에 저장
    :new.consult_room_id := v_consult_room_id;
END;
/

COMMIT;

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
                    || reserve_time, 'YYYY-MM-DD HH24:MI') <= current_timestamp;

END;
/

BEGIN
    dbms_scheduler.drop_job(job_name => 'ace.update_expired_reservations', defer => false, force => false);
END;

BEGIN
    dbms_scheduler.create_job(job_name => 'ace.update_expired_reservations', job_type => 'STORED_PROCEDURE',
                             job_action => 'ace.expired_reservations',
                             number_of_arguments => 0,
                             start_date => NULL,
                             repeat_interval => 'FREQ=HOURLY;BYMINUTE=0;BYSECOND=0',
                             end_date => NULL,
                             enabled => false,
                             auto_drop => false,
                             comments => '지난 예약 업데이트');
END;

-- 스케줄러 시작 명령어
BEGIN
    dbms_scheduler.enable(name => 'ace.update_expired_reservations');
END;

-- 스케줄러 정지 명령어
BEGIN
	DBMS_SCHEDULER.disable(name=>'ace.update_expired_reservations', force => TRUE);
END;