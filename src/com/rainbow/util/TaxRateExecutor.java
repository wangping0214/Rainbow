package com.rainbow.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rainbow.dao.TaxRateDAO;
import com.rainbow.entity.TaxRate;

/**
 * @use Insert this month's taxrate into mysql
 * @author STerOTto
 *
 */
public class TaxRateExecutor extends Thread
{
	private static final Log logger = LogFactory.getLog(TaxRateExecutor.class);

	private static final float TAX_RATE = 30f;
	private static final float CHANNEL_MESSAGE = 30f;
	private static final float CHANNEL_ALIPAY = 1.2f;
	private static final float CHANNEL_BANK = 1.5f;

	private TaxRateDAO _taxRateDAO;

	public TaxRateExecutor(Object taxRateDAO)
	{
		super();
		logger.info("TaxRateExecutor create");
		this._taxRateDAO = (TaxRateDAO) taxRateDAO;
	}

	public void run()
	{
		while (true)
		{
			try
			{
				Thread.sleep(3000);
				SimpleDateFormat formatMonth = new SimpleDateFormat("yyyy-MM");
				SimpleDateFormat formatNow = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = new Date();
				String thisMonth = formatMonth.format(date);
				String now = formatNow.format(date);
				TaxRate taxRate = _taxRateDAO.findByYearMonth(thisMonth);
				//if cannot find taxrate by this month,insert a new record into mysql
				if (null == taxRate)
				{
					taxRate = new TaxRate();
					taxRate.setTime(now);
					taxRate.setTax_rate(TAX_RATE);
					taxRate.setChannel_message(CHANNEL_MESSAGE);
					taxRate.setChannel_alipay(CHANNEL_ALIPAY);
					taxRate.setChannel_bank(CHANNEL_BANK);
					_taxRateDAO.save(taxRate);
					logger.info(String.format("Insert %s's taxrate into mysql",thisMonth));
				}
			} catch (InterruptedException e)
			{
				e.printStackTrace();
			}
		}
	}

}
