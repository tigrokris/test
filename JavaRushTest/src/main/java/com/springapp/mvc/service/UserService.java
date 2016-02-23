package com.springapp.mvc.service;

import com.springapp.mvc.entity.UserEntity;
import com.springapp.mvc.utils.HibernateSessionFactory;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserService {

    private static final int limitResultsPerPage=20;

    /**
     * Retrieves all users
     *
     * @return a list of user
     */
    public List<UserEntity> getAll(int page) {

        // Retrieve session from Hibernate
        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        session.beginTransaction();

        // Create a Hibernate query (HQL)
        Query query = session.createQuery("FROM UserEntity");
        query.setFirstResult((page-1) * limitResultsPerPage);
        query.setMaxResults(limitResultsPerPage);
        session.getTransaction().commit();

        List<UserEntity> list=query.list();

        session.close();
        return list;
    }

    /**
     * Retrieves a single person
     */
    public UserEntity get( Integer id ) {
        // Retrieve session from Hibernate
        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        session.beginTransaction();

        UserEntity person = (UserEntity) session.get(UserEntity.class, id);
        session.getTransaction().commit();
        session.close();
        return person;
    }

    public List<UserEntity> getByName( String name ) {
        // Retrieve session from Hibernate
        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        session.beginTransaction();

        Query query = session.createQuery("FROM UserEntity where name = :paramName");
        query.setParameter("paramName", name);
        session.getTransaction().commit();
        List<UserEntity> list=query.list();
        session.close();
        return list;
    }
    /**
     * Adds a new person
     */
    public void add(UserEntity user) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        session.beginTransaction();
        user.setCreateDate(new Date());
        session.save(user);
        session.getTransaction().commit();
        session.close();
    }
    /**
     * Deletes an existing person
     * @param id the id of the existing person
     */
    public void delete(Integer id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        session.beginTransaction();
        UserEntity person = (UserEntity) session.get(UserEntity.class, id);
        session.delete(person);
        session.getTransaction().commit();
        session.close();
    }

    /**
     * Edits an existing person
     */
    public void edit(UserEntity user) {

        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        session.beginTransaction();
        UserEntity existingUser = (UserEntity) session.get(UserEntity.class, user.getId());

        existingUser.setName(user.getName());
        existingUser.setAge(user.getAge());
        existingUser.setIsAdmin(user.getIsAdmin());

        session.save(existingUser);
        session.getTransaction().commit();
        session.close();
    }
}
