package com.xworkz.parkingrental.repository;

import com.xworkz.parkingrental.entity.ParkingInfoEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import javax.transaction.Transactional;

@Repository
public class ParkingInfoRepo {

    @PersistenceContext
    private EntityManager entityManager;

    public ParkingInfoEntity findByLocationAndVehicleTypeAndEngineTypeAndClsAndTermAndSlots(
            String location, String vehicleType, String engineType,
            String classification, String term) {
        try {
            return entityManager.createQuery(
                            "SELECT p FROM ParkingInfoEntity p " +
                                    "WHERE p.location = :lc " +
                                    "AND p.vehicleType = :vt " +
                                    "AND p.engineType = :et " +
                                    "AND p.classification = :cls " +
                                    "AND p.term = :trm " ,

                            ParkingInfoEntity.class)
                    .setParameter("lc", location)
                    .setParameter("vt", vehicleType)
                    .setParameter("et", engineType)
                    .setParameter("cls", classification)
                    .setParameter("trm", term)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }


    @Transactional
    public boolean saveParkingInfo(ParkingInfoEntity entity) {
        try {
            entityManager.persist(entity);
            return true;
        } catch (PersistenceException e) {
            return false;
        }
    }

    @Transactional
    public boolean updateParkingInfo(ParkingInfoEntity entity) {
        try {
            entityManager.merge(entity);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
