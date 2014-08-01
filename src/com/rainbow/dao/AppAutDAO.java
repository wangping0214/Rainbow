package com.rainbow.dao;

import java.util.List;

import com.rainbow.entity.AppAuthority;

public interface AppAutDAO {
	public List<AppAuthority> findAll();
	public AppAuthority findById(int id);
	
	/**前台查询应用是否推荐
	 * @param recomLevel
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByRecomLevel(int recomLevel,int currentPage,int pageSize);
	public int findByRecomLevelNum(int recomLevel);
	
	/**根据评分和下载量排行
	 * @param score
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByScoreAndDown(int score,int currentPage,int pageSize);
	public int findByScoreAndDownNum(int score);
	
	/**将所有通过审核的应用按评分排名
	 * @return
	 */
	public List<AppAuthority> findRank(int score,int shelf,int currentPage,int pageSize);
	public int findRankNum(int score,int shelf);
	
	
	/**精品推荐 推荐级别 > 评分 > 下载量
	 * 
	 * @param recomLevel
	 * @param score
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByBoutique(int recomLevel,int score,int currentPage,int pageSize);
	
	/**游戏或应用排行榜
	 * 推荐级别 > 评分 > 下载量 > 发布时间
	 * @param type
	 * @param recomLevel
	 * @param score
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<AppAuthority> findByTypeRank(String type,int recomLevel,int score,int currentPage,int pageSize);
	public int findByTypeRankNum(String type,int recomLevel,int score);
	
	/**根据用户下载游戏类别推荐其他应用
	 * id不等于当前应用的id
	 * 类别->推荐级别 > 评分 > 下载量 > 发布时间
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
