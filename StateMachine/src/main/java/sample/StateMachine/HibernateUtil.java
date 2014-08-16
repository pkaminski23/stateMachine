package sample.StateMachine;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
        
        private static final SessionFactory sessionFactory; 
        private static final Session currentSession;
      
        static {  
            try {  
                // Create the SessionFactory from hibernate.cfg.xml
            	Configuration config = new Configuration().configure();
            	config.addAnnotatedClass(Document.class);
                sessionFactory = config.buildSessionFactory();
                currentSession = sessionFactory.openSession();
            } catch (Throwable ex) {  
                // Make sure you log the exception, as it might be swallowed  
                System.err.println("Initial SessionFactory creation failed." + ex);  
                throw new ExceptionInInitializerError(ex);  
            }  
        }  
      
        public static SessionFactory getSessionFactory() {  
            return sessionFactory;  
        }

        public static Session getCurrentSession() {  
            return currentSession;  
        }
}
