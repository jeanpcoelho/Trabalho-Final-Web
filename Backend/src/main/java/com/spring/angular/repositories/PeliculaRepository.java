package com.spring.angular.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spring.angular.models.Pelicula;

public interface PeliculaRepository extends JpaRepository<Pelicula, Integer>{

	List<Pelicula> findByTituloContainingIgnoreCase(String titulo);
	List<Pelicula> findByAnio(int anio);
	List<Pelicula> findByPeliculaGeneroIdGenero(int codCategoria);
	
	List<Pelicula> findAll();
	
	List<Pelicula> findById(int idPelicula);

	@Query("SELECT p FROM Pelicula p")
	List<Pelicula> obtenerRegistrosParaExportar();
}
