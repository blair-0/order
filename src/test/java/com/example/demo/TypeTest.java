package com.example.demo;

import java.util.List;
import java.util.Optional;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.demo.dao.TypeDao;
import com.example.demo.model.Type;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TypeTest {
	@Autowired
	private TypeDao typeDao;
	
	@Before
	public void before() {
		Type type = new Type();
		type.setId(1);
		type.setName("服务器");
		typeDao.save(type);
		
		type = new Type();
		type.setId(3);
		type.setName("交换机");
		typeDao.save(type);
	}
	
	@Test
	public void testAdd() {
		Type type = new Type();
		type.setId(2);
		type.setName("机柜");
		typeDao.save(type);
		
		type = new Type();
		type.setId(4);
		type.setName("存储");
		typeDao.save(type);
	}
	
	@After
	public void after() {
		typeDao.deleteById(1);
		typeDao.deleteById(3);
	}
	
	@Test
	public void testLocate() {
		Optional<Type> typeOptional = typeDao.findById(1);
		if(typeOptional.isPresent()) {
			Type type = typeOptional.get();
			System.out.println("name = " + type.getName());
		}
	}
	
	@Test
	public void testFindAll() {
		List<Type> typeList = typeDao.findAll(new Sort(Sort.Direction.DESC, "name"));
		for(Type type : typeList) {
			System.out.println("name = " + type.getName());
		}
	}
	
	@Test
	public void testFindByName() {
		Type type = typeDao.findByName("交换机");
		if(type != null) {
			System.out.println("name = " + type.getName());
		}
	}
}
