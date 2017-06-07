package com.cd.clothes.controller;

import com.cd.clothes.service.StockInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/7
 * time 10:06
 */
@Controller
@RequestMapping("/stockIn")
public class StockInController {
    @Autowired
    private StockInService stockInService;


}
