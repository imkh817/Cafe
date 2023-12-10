package com.myhome.project.service;

import java.util.List;

import com.myhome.project.model.Cafe;

public interface CafeService {
	
	public void cafe_insert(Cafe cafe) throws Exception;

	public void cafe_readcount(int cafe_no);

	Cafe select(int cafe_no);

	public void cafe_update(Cafe cafe);



	
}