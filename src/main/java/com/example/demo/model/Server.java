package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.Table;

public class Server extends Hardware {
	private Hardware cpu;
	private Hardware mem;
	private Hardware disk;
}
