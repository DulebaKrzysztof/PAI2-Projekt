package pl.cinema.registrationAndLogin.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import pl.cinema.registrationAndLogin.model.User;
import pl.cinema.registrationAndLogin.web.dto.UserRegistrationDto;

public interface UserService extends UserDetailsService{
	User save(UserRegistrationDto registrationDto);
}
