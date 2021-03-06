package com.unisys.training.service.impl;

import com.unisys.training.dao.FlightDao;
import com.unisys.training.dao.RouteDao;
import com.unisys.training.po.Flight;
import com.unisys.training.po.Route;
import com.unisys.training.service.FlightService;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;

@Service
@Transactional
public class FlightServiceImpl implements FlightService {
    @Autowired
    private FlightDao flightDao;
    @Autowired
    private RouteDao routeDao;
    
    static final int FAILED = 0;

    @Override
	@RequiresPermissions("flight:maintain")
    public int FlightInsert(Flight flight) {
    	if(flight.getRoutes().size()<=0) {
    		return FAILED;
    	}
    	
        int result = flightDao.FlightInsert(flight);
        if (result <= 0) {
            throw new RuntimeException("Flight insert failed.");
        }
        if (flight.getId() <= 0) {
            throw new RuntimeException("Failed to get flight ID.");
        }

        // insert route
        for (Iterator<Route> it = flight.getRoutes().iterator(); it.hasNext(); ) {
            Route route = it.next();
            // provide flight id before insert
            route.setFlight_id(flight.getId());
            result = routeDao.RouteInsert(route);
            if (result == 0) {
                throw new RuntimeException("Flight's route insert failed.");
            }
        }

        return result;
    }

    @Override
	@RequiresPermissions("flight:maintain")
    public int FlightDelete(int id) {
    	int result = 0;
    	result = routeDao.RouteDeleteByFlightId(id);
    	if (result<=0) {
    		throw new RuntimeException("Failed to delete flight routes.");
    	}
        return flightDao.FlightDelete(id);
    }

    @Override
	@RequiresPermissions("flight:maintain")
    public int FlightUpdate(Flight flight) {
        return flightDao.FlightUpdate(flight);
    }

    @Override
	@RequiresPermissions("flight:view")
    public Flight FlightSelectOne(Flight flight) {
        Flight aFlight = flightDao.FlightSelectOne(flight);
        List<Route> routes = routeDao.RouteSelectByFlight(aFlight.getId());
    	aFlight.setRoutes(routes);
        return aFlight;
    }

    @Override
	@RequiresPermissions("flight:view")
    public List<Flight> FlightSelectAll(int offset, int limit) {
        offset = offset < 0 ? 0 : offset;
        List<Flight> flights = flightDao.FlightSelectAll(offset, limit);
        for(Iterator<Flight> it=flights.iterator(); it.hasNext();) {
        	Flight aFlight = it.next();
        	List<Route> routes = routeDao.RouteSelectByFlight(aFlight.getId());
        	aFlight.setRoutes(routes);
        }
        return flights;
    }

    @Override
	@RequiresPermissions("flight:view")
    public int FlightCount() {
        return flightDao.FlightCount();
    }

}
