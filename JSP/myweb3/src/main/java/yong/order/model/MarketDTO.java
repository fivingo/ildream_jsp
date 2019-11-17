package yong.order.model;

public class MarketDTO {
	private String marketname;
	private String markettel;
	private String marketaddr;
	
	public MarketDTO() {
		super();
	}
	public MarketDTO(String marketname, String markettel, String marketaddr) {
		super();
		this.marketname = marketname;
		this.markettel = markettel;
		this.marketaddr = marketaddr;
	}
	
	public String getMarketname() {
		return marketname;
	}
	public void setMarketname(String marketname) {
		this.marketname = marketname;
	}
	public String getMarkettel() {
		return markettel;
	}
	public void setMarkettel(String markettel) {
		this.markettel = markettel;
	}
	public String getMarketaddr() {
		return marketaddr;
	}
	public void setMarketaddr(String marketaddr) {
		this.marketaddr = marketaddr;
	}
}
