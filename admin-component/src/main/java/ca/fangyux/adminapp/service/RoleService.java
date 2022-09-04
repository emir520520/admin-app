package ca.fangyux.adminapp.service;

import ca.fangyux.adminapp.entity.Role;
import com.github.pagehelper.PageInfo;

public interface RoleService {

    PageInfo<Role> getPageInfo(Integer pageNum, Integer pageSize, String keyword);

    void addRole(Role role);

    void updateRole(Role role);
}