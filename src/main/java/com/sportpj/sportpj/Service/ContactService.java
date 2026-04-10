package com.sportpj.sportpj.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportpj.sportpj.Model.ContactModel;
import com.sportpj.sportpj.Repository.ContactRepository;
import com.sportpj.sportpj.Repository.UserRepository;
import com.sportpj.sportpj.helpers.JwtHelper;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ContactService {
  @Autowired
  ContactRepository contactRepository;
  @Autowired
  UserRepository userRepository;
  @Autowired
  JwtHelper jwtHelper;
  
  public ContactModel saveContact(ContactModel contactModel, HttpServletRequest request){
    
    String submittedName = contactModel.getName();
        
        if (submittedName != null && !submittedName.isEmpty()) {
            contactModel.setCreatedBy(submittedName);
            contactModel.setUpdatedBy(submittedName);
        } else {
            contactModel.setCreatedBy("Guest");
            contactModel.setUpdatedBy("Guest");
        }
    return contactRepository.save(contactModel);
  }
}
