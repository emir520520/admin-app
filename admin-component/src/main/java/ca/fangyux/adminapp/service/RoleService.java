package ca.fangyux.adminapp.service;

import ca.fangyux.adminapp.entity.Role;
import com.github.pagehelper.PageInfo;

import java.util.ArrayList;
import java.util.List;

public interface RoleService {

    PageInfo<Role> getPageInfo(Integer pageNum, Integer pageSize, String keyword);

    void addRole(Role role);

    void updateRole(Role role);

    void removeRoles(List<Integer> roleList);
}