package com.niit.foodcart.dao.impl;

//import com.niit.foodcart.dao.CustomerDao;
//import com.BagStore.model.Authorities;
import com.niit.foodcart.model.Cart;
import com.niit.foodcart.model.Customer;
import com.niit.foodcart.model.Registration;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao{

    @Autowired
    private SessionFactory sessionFactory;

    public void addCustomer(Customer customer){
        Session session = sessionFactory.getCurrentSession();

        customer.getBillingAddress().setCustomer(customer);
        customer.getShippingAddress().setCustomer(customer);

        session.saveOrUpdate(customer);
        session.saveOrUpdate(customer.getBillingAddress());
        session.saveOrUpdate(customer.getShippingAddress());

        Registration registration = new Registration();
        registration.setUsername(customer.getUsername());
        registration.setPassword(customer.getPassword());
        registration.setEnabled(true);
        registration.setCustomerId(customer.getCutomerId());

//        Authorities newAuthorities = new Authorities();
//        newAuthorities.setUsername(customer.getUsername());
//        newAuthorities.setAuthority("ROLE_USER");
//        session.saveOrUpdate(newUser);
//        session.saveOrUpdate(newAuthorities);

        Cart newCart = new Cart();
        newCart.setCustomer(customer);
        customer.setCart(newCart);

        session.saveOrUpdate(customer);
        session.saveOrUpdate(newCart);

        session.flush();
    }

    public Customer getCustomerById(int customerId){
        Session session = sessionFactory.getCurrentSession();
        return (Customer) session.get(Customer.class, customerId);
    }

    public List<Customer> getAllCustomers(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer");
        List<Customer> customerList = query.list();

        return customerList;

    }

    public Customer getCustomerByUsername(String username){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer where username = ?");
        query.setString(0, username);


        return (Customer) query.uniqueResult();
    }


} // The End of Class;
