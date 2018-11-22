package kr.or.ddit.web.calculate;


public enum Operator {

	
	ADD("+",new RealOperator() {
		@Override
		public int operate(int leftOp, int rightOp) {
			return leftOp + rightOp;
		}
	}),
	MINUS("-", (leftOp, rightOp)->{return leftOp-rightOp;}), 
	MULTIPLY("*", (a, b)->{return a*b;}),
	DIVIDE("/", (c,d)->{return c/d;});
	
	
	private String sign;
	private RealOperator realOperator;
	Operator(String sign, RealOperator realOperator){
		this.sign= sign;
		this.realOperator = realOperator;
	}
	public String getSign(){
		return this.sign;
	}
	public int operate(int leftOp, int rightOp) {
		return realOperator.operate(leftOp, rightOp);
	}
}
