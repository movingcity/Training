package com.unisys.training.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class FlightController {

    @RequestMapping("/flight/insert")
    private Object flightInsert(HttpServletRequest req) {
        return null;
    }

    @RequestMapping("/flight/update")
    private Object flightUpdate(HttpServletRequest req) {
        return null;
    }

    @RequestMapping("/flight/delete")
    private Object flightDelete(HttpServletRequest req) {
        return null;
    }

    @RequestMapping("/flight/selectOne")
    private Object flightSelectOne(HttpServletRequest req) {
        return null;
    }

    @RequestMapping("/flight/selectAll")
    private Object flightSelectAll(HttpServletRequest req) {
        return null;
    }

}
