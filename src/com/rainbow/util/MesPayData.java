package com.rainbow.util;

import java.util.ArrayList;
import java.util.List;

public class MesPayData {
	private static final MesPayData _instance;
	
	static{
		_instance = new MesPayData();
	}
	
	public static MesPayData getInstance(){
		return _instance;
	}
	
	private List<PayData>  payData;
	
	private MesPayData(){
		payData = new ArrayList<>();
		payData.add(new PayData("0000000010356453","000000010149"));//1
		payData.add(new PayData("0000000010356454","000000010150"));//2
		payData.add(new PayData("0000000010356455","000000010151"));//3
		payData.add(new PayData("0000000010356456","000000010152"));//4
		payData.add(new PayData("0000000010356457","000000010153"));//5
		payData.add(new PayData("0000000010356458","000000010169"));//6
		payData.add(new PayData("0000000010356459","000000010170"));//7
		payData.add(new PayData("0000000010356460","000000010171"));//8
		payData.add(new PayData("0000000010356461","000000010172"));//9
		payData.add(new PayData("0000000010356462","000000010173"));//10
		payData.add(new PayData("0000000010356463","000000010174"));//11
		payData.add(new PayData("0000000010356464","000000010175"));//12
		payData.add(new PayData("0000000010356465","000000010176"));//13
		payData.add(new PayData("0000000010356466","000000010177"));//14
		payData.add(new PayData("0000000010356467","000000010178"));//15
		payData.add(new PayData("0000000010356469","000000010179"));//16
		payData.add(new PayData("0000000010356468","000000010180"));//17
		payData.add(new PayData("0000000010356471","000000010181"));//18
		payData.add(new PayData("0000000010356470","000000010182"));//19
		payData.add(new PayData("0000000010356473","000000010183"));//20
		payData.add(new PayData("0000000010356472","000000010199"));//21
		payData.add(new PayData("0000000010356475","000000010200"));//22
		payData.add(new PayData("0000000010356474","000000010201"));//23
		payData.add(new PayData("0000000010356477","000000010202"));//24
		payData.add(new PayData("0000000010356476","000000010203"));//25
		payData.add(new PayData("0000000010356479","000000010204"));//26
		payData.add(new PayData("0000000010356478","000000010205"));//27
		payData.add(new PayData("0000000010356481","000000010206"));//28
		payData.add(new PayData("0000000010356480","000000010207"));//29
		payData.add(new PayData("0000000010356482","000000010208"));//30
		
	}
	
	
	public List<PayData> getPayData(){
		return payData;
	}
}
