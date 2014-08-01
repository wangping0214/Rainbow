package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppAuthority;

public interface AppAutDAO {
	public List<AppAuthority> findAll();
	public AppAuthority findById(int id);
	
	/**ǰ̨��ѯӦ���Ƿ��Ƽ�
	 * @param recomLevel
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByRecomLevel(int recomLevel,int currentPage,int pageSize);
	public int findByRecomLevelNum(int recomLevel);
	
	/**�������ֺ�����������
	 * @param score
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByScoreAndDown(int score,int currentPage,int pageSize);
	public int findByScoreAndDownNum(int score);
	
	/**������ͨ����˵�Ӧ�ð���������
	 * @return
	 */
	public List<AppAuthority> findRank(int score,int shelf,int currentPage,int pageSize);
	public int findRankNum(int score,int shelf);
	
	
	/**��Ʒ�Ƽ� �Ƽ����� > ���� > ������
	 * 
	 * @param recomLevel
	 * @param score
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByBoutique(int recomLevel,int score,int currentPage,int pageSize);
	
	/**��Ϸ��Ӧ�����а�
	 * �Ƽ����� > ���� > ������ > ����ʱ��
	 * @param type
	 * @param recomLevel
	 * @param score
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByTypeRank(String type,int recomLevel,int score,int currentPage,int pageSize);
	public int findByTypeRankNum(String type,int recomLevel,int score);
	
	/**�����û�������Ϸ����Ƽ�����Ӧ��
	 * id�����ڵ�ǰӦ�õ�id
	 * ���->�Ƽ����� > ���� > ������ > ����ʱ��
	 * @param classification
	 * @param recomLevel
	 * @param score
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByClassification(String classification,int id,int recomLevel,int score,int currentPage,int pageSize);
	
	public void save(AppAuthority appAut);
	public void update(int id,AppAuthority appAut);
	public void updatePart(AppAuthority appAut);
	public void delete(int id);

}
