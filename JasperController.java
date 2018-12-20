package com.payboot.admin.controller.jaspertest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;

import javax.sql.DataSource;

@Controller
@RequestMapping(value = "/jasper")
public class JasperController {

    @Autowired
    private ApplicationContext appContext;
    @Autowired
    private DataSource dataSource;

    @RequestMapping(value = "/pdf", method = RequestMethod.GET)
    public ModelAndView report() {

        JasperReportsPdfView view = new JasperReportsPdfView();
        view.setJdbcDataSource(dataSource);
        view.setUrl("classpath:Cherry.jrxml");
        view.setApplicationContext(appContext);
        return new ModelAndView(view);
    }
}


