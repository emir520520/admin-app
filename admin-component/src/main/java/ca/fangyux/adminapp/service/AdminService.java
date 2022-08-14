package ca.fangyux.adminapp.service;

import ca.fangyux.adminapp.entity.Admin;

import java.util.List;

public interface AdminService {
    void saveAdmin(Admin admin) throws Exception;

    List<Admin> getAll();

    Admin getAdminByCredentials(String account, String password) throws Exception;
}