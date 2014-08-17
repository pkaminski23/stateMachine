package sample.StateMachine;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

@Controller
public class StateController {
   
    @RequestMapping(value = "/beginState", method = RequestMethod.GET)
    public ModelAndView beginState() {
    	ModelAndView modelAndView = new ModelAndView("beginState", "command", new StateForm());
      
      return modelAndView;
    }
   
    @RequestMapping(value = "/createState", method = RequestMethod.POST)
    public ModelAndView createState(@ModelAttribute("SpringWeb")StateForm stateForm) {
    	ModelAndView modelAndView = new ModelAndView("createState", "command", stateForm);
    	Session session = HibernateUtil.getSessionFactory().openSession();
    	session.beginTransaction();
    	Document doc = new Document();
    	doc.setStateName(stateForm.getName());
    	doc.setStateContent(stateForm.getContent());
    	doc.setCreatedAt(new Date());
    	stateForm.setCreated(doc.getCreatedAt());
    	System.out.println("asdadasdasd: " + stateForm.getId());
    	try {
    		session.save(doc);
    		session.getTransaction().commit();
    	} catch (Exception e) {
    		System.out.println("adadad: " + e.getMessage());
    	} finally {
    		session.close();
    	}	
    	stateForm.setId(doc.getStateId());
      
        return modelAndView;
    }

    @RequestMapping(value = "/verifyState", method = RequestMethod.POST)
    public ModelAndView verifyState(@ModelAttribute("SpringWeb")StateForm stateForm, 
    	    ModelMap model) {
    	ModelAndView modelAndView = new ModelAndView("verifyState", "command", stateForm);
    	Session session = HibernateUtil.getCurrentSession();
    	session.beginTransaction();
    	try {
    		Document doc = (Document)session.get(Document.class, stateForm.getId());
        	doc.setStateName(stateForm.getName());
        	doc.setStateContent(stateForm.getContent());
    		doc.setVerifiedAt(new Date());
    		stateForm.setVerified(doc.getVerifiedAt());
        	session.update(doc);
        	session.getTransaction().commit();
    	} catch (Exception e) {
    	} finally {	
    	}
        
        return modelAndView;
    }
   
    @RequestMapping(value = "/acceptState", method = RequestMethod.POST)
    public ModelAndView acceptState(@ModelAttribute("SpringWeb")StateForm stateForm, 
		   ModelMap model) {
    	ModelAndView modelAndView = new ModelAndView("acceptState", "command", stateForm);
	 	Session session = HibernateUtil.getCurrentSession();
    	session.beginTransaction();
    	try {
    		Document doc = (Document)session.get(Document.class, stateForm.getId());
    		doc.setAcceptedAt(new Date());
        	doc.setStateName(stateForm.getName());
        	doc.setStateContent(stateForm.getContent());
    		stateForm.setAccepted(doc.getAcceptedAt());
        	session.update(doc);
        	session.getTransaction().commit();
    	} catch (Exception e) {
    	} finally {	
    	}
      
       return modelAndView;
    }
    
    @RequestMapping(value = "/rejectState", method = RequestMethod.POST)
    public ModelAndView rejectState(@ModelAttribute("SpringWeb")StateForm stateForm, 
 		   ModelMap model) {
	 	Session session = HibernateUtil.getCurrentSession();
    	session.beginTransaction();
    	try {
    		Document doc = (Document)session.get(Document.class, stateForm.getId());
    		doc.setStateReason(stateForm.getReason());
    		doc.setRejectedAt(new Date());
        	session.update(doc);
        	session.getTransaction().commit();
    	} catch (Exception e) {
    	} finally {	
    	}
    	
        return list("0");
    }
    
    @RequestMapping(value = "/deleteState/{stateId}", method = RequestMethod.POST)
    public ModelAndView deleteState(@PathVariable("stateId") Integer stateId) {
	 	Session session = HibernateUtil.getCurrentSession();
	 	session.beginTransaction();
    	try {
    		Document doc = (Document)session.get(Document.class, stateId);
        	session.delete(doc);
        	session.getTransaction().commit();
    	} catch (Exception e) {
    		System.out.println("felteL " + stateId + " " + e.getMessage());
    	} finally {	
    	}
      
       return list("0");
    }
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(@RequestParam(required=false) String page) {
    	ModelAndView modelAndView = new ModelAndView("list");
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		List<Document> states = null;
		int pageNo = 0;
		try {
			pageNo = Integer.parseInt(page);
		} catch (Exception e) {
		}
		try {
			states = session.createCriteria(Document.class).list();
		} catch (Exception e) {
		}
		session.close();
        PagedListHolder pagedListHolder = new PagedListHolder(states);
        pagedListHolder.setPage(pageNo);
        int pageSize = 2;
        pagedListHolder.setPageSize(pageSize);
        modelAndView.addObject("pagedListHolder", pagedListHolder);

		modelAndView.addObject("states", states);
        return modelAndView;
    }
}
