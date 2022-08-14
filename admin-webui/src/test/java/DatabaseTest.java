import ca.fangyux.adminapp.entity.Admin;
import ca.fangyux.adminapp.mapper.AdminMapper;
import ca.fangyux.adminapp.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-persist-config.xml","classpath:spring-persist-tx.xml"})
public class DatabaseTest {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private AdminService adminService;

    @Test
    public void testConnection() throws SQLException {
        Connection c=dataSource.getConnection();

        Logger logger= LoggerFactory.getLogger(DatabaseTest.class);
        logger.info("Test Connection:"+c);
    }

    @Test
    public void testAdminMapper(){
        Admin admin=new Admin(null, "frankfang111", "2333", "fangyux", "frankfang111@gmail.com", null);
        int result=adminMapper.insert(admin);
        System.out.println(result);
    }

    @Test
    public void testTransaction() throws Exception {
        Admin admin=new Admin(null, "f1138675990", "6666", "fangyux", "1138675990@qq.com", null);
        adminService.saveAdmin(admin);
    }
}