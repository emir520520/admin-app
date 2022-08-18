package ca.fangyux.adminapp.service;

import ca.fangyux.adminapp.entity.Admin;
import ca.fangyux.adminapp.entity.AdminExample;
import ca.fangyux.adminapp.mapper.AdminMapper;
import ca.fangyux.adminapp.utils.Props;
import ca.fangyux.adminapp.utils.Utils;
import ca.fangyux.adminapp.utils.exception.LoginFailedException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public void saveAdmin(Admin admin) throws Exception {
        adminMapper.insert(admin);
//        System.out.println(1/0);
    }

    @Override
    public List<Admin> getAll(){
        return adminMapper.selectByExample(new AdminExample());
    }

    @Override
    public Admin getAdminByCredentials(String account, String password) throws Exception {
        //查询admin对象
        AdminExample adminExample=new AdminExample();

        AdminExample.Criteria critiria=adminExample.createCriteria();

        critiria.andLoginAcctEqualTo(account);

        List<Admin> list=adminMapper.selectByExample(adminExample);

        if(list==null || list.size()==0){
            throw new LoginFailedException(Props.MSG_LOGIN_FAILED_ACCOUNT_NOT_EXIST);
        }else if(list.size()>1){
            throw new RuntimeException(Props.MSG_LOGIN_FAILED_ACCOUNT_REDUNDANT);
        }

        Admin admin=list.get(0);

        if(admin==null){
            throw new LoginFailedException(Props.MSG_LOGIN_FAILED_ACCOUNT_NOT_EXIST);
        }

        //从admin对象获得密码
        String passwordRetrieved=admin.getUserPswd();

        String passwordAfterEncrypt;

        //将页面提交的密码明文进行加密， 并与数据库得到的密码进行比较
        passwordAfterEncrypt= Utils.MD5(password);


        if(!Objects.equals(passwordRetrieved,passwordAfterEncrypt)){
            throw new LoginFailedException(Props.MSG_LOGIN_FAILED_PASSWORD_INCORRECT);
        }

        return admin;
    }

    @Override
    public PageInfo<Admin> getPageInfo(String keyword, Integer pageNum, Integer pageSize) {
        //1.调用pageHelper的静态方法开启分页功能(我们不需要该其他任何地方，这叫非侵入式）
        PageHelper.startPage(pageNum,pageSize);

        //2.执行查询
        List<Admin> list=adminMapper.selectAdminByKeyword(keyword);

        //3.将查到的结果封装到pageInfo对象中
        return new PageInfo<>(list);
    }
}