package ca.fangyux.adminapp.mvc.config;

import ca.fangyux.adminapp.utils.Props;
import ca.fangyux.adminapp.utils.ResultEntity;
import ca.fangyux.adminapp.utils.Utils;
import ca.fangyux.adminapp.utils.exception.LoginFailedException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
public class MyExceptionResolver {

    @ExceptionHandler(value = NullPointerException.class)
    public ModelAndView resolveNullPointerException(NullPointerException exception, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String view="error";

        return commonResolve(view, exception, request, response);
    }

    @ExceptionHandler(value= LoginFailedException.class)
    public ModelAndView resolveLoginFailedException(
            LoginFailedException exception,
            HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        String view="admin-login";

        return commonResolve(view, exception, request, response);
    }

    private ModelAndView commonResolve(
            String view,
            Exception exception,
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        boolean requestType=Utils.detectRequestTypeForExceptionHandling(request);

        //请求为Ajax类型
        if(requestType==true){
            //创建ResultEntity对象
            ResultEntity<Object> resultEntity=ResultEntity.failed(String.valueOf(exception.getClass()));

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            String json = ow.writeValueAsString(resultEntity);

            response.getWriter().write(json);
            response.setStatus(500);

            return null;
        }else{
            ModelAndView mv=new ModelAndView();
            mv.addObject(Props.MODEL_ATTRIBUTE_EXCEPTION,exception);
            mv.setViewName(view);

            return mv;
        }
    }
}