package com.kosa.theBeauty.user.service;

import org.springframework.stereotype.Service;

import com.kosa.theBeauty.annotation.DebugLog;
import com.kosa.theBeauty.user.dao.UserDAO;
import com.kosa.theBeauty.user.domain.UserDTO;
import com.kosa.theBeauty.user.domain.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

   private final UserDAO dao;

   public UserVO login(UserDTO dto) {

      return dao.selectUserByDTO(dto);
   }

   public String findEmail(UserDTO dto) {

        String userMail ;
        try {
            userMail = dao.selectOne(dto).getUserMail();
        } catch (Exception e) {
            userMail = "입력하신 정보의 아이디가 없습니다.";
        }
        return userMail;
   }

   // 회원가입 시 이메일 중복 검사
   public String checkMail(String userMail) {

      String result = dao.selectOneUserMail(userMail);
      System.out.println(result);
      return result;

   }

   // 회원가입
   public boolean registerUser(UserVO userVO) {

      int cnt = dao.insertUser(userVO);
      if (cnt != 1) {
         // rollback
         return false;
      } else {
         return true;
      }
   }

    public boolean findPassword(UserVO user) {
        user = dao.selectPassword(user);
        if(user!=null) {
            return true;
        } else {
            return false;
       }
     }
   
   public boolean updatePassword(UserVO vo) {
       return dao.updatePassword(vo) > 0;
   }

}