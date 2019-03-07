package br.com.garten.calmedumi;

import java.util.LinkedList;

public class ListaAmostras extends LinkedList<Amostra>{
	
	private static final long serialVersionUID = 1L;
	
	
	public double[] getAmostrasLaboratorio() {
		
		double[] vetor = new double[this.size()];
		for(int i = 0 ; i < this.size(); i ++) {
			vetor[i] = this.get(i).getAmostraLaboratorio();
		}
		
		return vetor;
	}
	
	public double[] getAmostrasGarten() {
		double[] vetor = new double[this.size()];
		for(int i = 0 ; i < this.size(); i ++) {
			vetor[i] = this.get(i).getAmostraGarten();
		}
		return vetor;
	}
	
	 
	
	public LinearRegression getLinearRegression() {
		return new LinearRegression(getAmostrasGarten(), getAmostrasLaboratorio());
	}

	public double getSlope(){
		LinearRegression linearSlope = getLinearRegression();
		return linearSlope.slope();
	}

	public double getIntercept(){
		LinearRegression linearIntercept =  getLinearRegression();
		return linearIntercept.intercept();
	}

}