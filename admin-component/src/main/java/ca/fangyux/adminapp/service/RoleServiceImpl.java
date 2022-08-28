package ca.fangyux.adminapp.service;

import ca.fangyux.adminapp.entity.Role;
import ca.fangyux.adminapp.mapper.RoleMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public PageInfo<Role> getPageInfo(Integer pageNum, Integer pageSize, String keyword) {
        //1.调用pageHelper的静态方法开启分页功能(我们不需要该其他任何地方，这叫非侵入式）
        PageHelper.startPage(pageNum,pageSize);

        //2.执行查询
        List<Role> list=roleMapper.selectRoleByKeyword(keyword);

        //3.将查到的结果封装到pageInfo对象中
        return new PageInfo<>(list);
    }
}