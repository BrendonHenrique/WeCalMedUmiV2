package br.com.garten.calmedumi;

import java.util.Locale;

public class Amostra {
	private Double amostraGarten;
	private Double amostraLaboratorio;
	
	
	public Amostra(String garten , String laboratorio) throws Exception {

		this.amostraGarten = Double.parseDouble(garten);
		this.amostraLaboratorio = Double.parseDouble(laboratorio);

	}
<<<<<<< HEAD
	
	
=======

>>>>>>> f3b4a411eca04a4ef42e41a468aa72ae94b4974a

	public Double getAmostraGarten() {
		return amostraGarten;
	}
	public void setAmostraGarten(Double amostraGarten) {
		this.amostraGarten = amostraGarten;
	}
	public Double getAmostraLaboratorio() {
		return amostraLaboratorio;
	}
	public void setAmostraLaboratorio(Double amostraLaboratorio) {
		this.amostraLaboratorio = amostraLaboratorio;
	}

	@Override
	public String toString() {
		return String.format(Locale.ENGLISH,"{x: %.2f, y: %.2f},",getAmostraGarten(),getAmostraLaboratorio());
	}
}
