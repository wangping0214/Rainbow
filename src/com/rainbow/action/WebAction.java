package com.rainbow.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReviewDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Review;
import com.rainbow.server.App;
import com.rainbow.util.AppTmp;
import com.rainbow.util.Classification;
import com.rainbow.util.PageUtil;

public class WebAction {
			//��ʼ������ֹע���ʵ��
			private AppAuthority appAut = new AppAuthority();
			private AppInfo appInfo = new AppInfo();
			private AppSource appSou = new AppSource();
			private AppTmp appTmp;	//���ڽ����ļ�����ʱ��Ϣ
			private Classification clf ;
			
			private AppAutDAO appAutDAO;
			private AppInfoDAO appInfoDAO;
			private AppSouDAO appSouDAO;
			private ReviewDAO reviewDAO;
			
			private HttpServletResponse response;
		    private HttpServletRequest request;
		    private HttpSession session;
		    
			/**
			 * ���Ͳ�ѯ 1��ʾ��Ϸ 2��ʾӦ��
			 */
			private int type;
			/**
			 * ��������ѯ
			 */
			private int classification=1;
			/**
			 * ��Ϸ��Ӧ�÷���
			 */
			private int category =1;
			private int downLoadId = 1;
			private int apkId = 1;
			
			private int rankMoreType;//����������1��Ӧ�� ��     2����Ϸ��
			private int rankMoreCurrentPage=1;//��ǰҳ��
			private String keyword;	//����������
			
			
			
			/**ǰ̨���ݷ�����ʾ��Ϸ��Ӧ��
			 * 1"��������",2"�������",3"��������",4"��������",5"���Ծ�Ӫ",6"���ٶ���",7"��ɫ����"
			 * 8"ϵͳ��ȫ",9"���ù���",10"��Ӱ����",11"Ӱ��ͼ��",12"�������",13"�罻ͨ��",14"ѧϰ�Ķ�"
			 * 
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String webShowByCategory(){
				String str="";
				switch(category){
				case 1:str="��������";
						clf = new Classification(1,1, 2, 3, 4, "��ͨ", "������", "����", "����","��������");
						break;
				case 2:str="�������";
						clf = new Classification(2,5, 6, 7, 8, "���", "���", "̹��", "����","�������");
						break;
				case 3:str="��������";
						clf = new Classification(3,9, 10, 11, 12, "�ֻ�", "����", "����", "̨��","��������");
						break;
				case 4:str="��������";
						clf = new Classification(4,13, 14, 15, 16, "������", "�齫", "ֽ��", "ƴͼ","��������");
						break;
				case 5:str="���Ծ�Ӫ";
						clf = new Classification(5,17, 18, 19, 20, "��Ӫ", "����", "����", "ս��","���Ծ�Ӫ");
						break;
				case 6:str="���ٶ���";
						clf = new Classification(6,21, 22, 23, 24, "�ܿ�", "���", "3D", "����","���ٶ���");
						break;
				case 7:str="��ɫ����";
						clf = new Classification(7,25, 26, 27, 28, "�غ���", "����", "����", "����","��ɫ����");
						break;
				case 8:str="ϵͳ��ȫ";
						clf = new Classification(8,29, 30, 31, 32, "�Ż�", "����", "��ȫ", "ɱ��","ϵͳ��ȫ");
						break;
				case 9:str="���ù���";
						clf = new Classification(9,33, 34, 35, 36, "�����", "���뷨", "�ļ�", "�칫","���ù���");
						break;
				case 10:str="��Ӱ����";
						clf = new Classification(10,37, 38, 39, 40, "����", "����", "��ֽ", "���","��Ӱ����");
						break;
				case 11:str="Ӱ��ͼ��";
						clf = new Classification(11,41, 42, 43, 44, "����", "��Ƶ", "���", "������","Ӱ��ͼ��");
						break;
				case 12:str="�������";
						clf = new Classification(12,45, 46, 47, 48, "����", "����", "���", "����","�������");
						break;
				case 13:str="�罻ͨ��";
						clf = new Classification(13,49, 50, 51, 52, "����", "����", "΢��", "����","�罻ͨ��");
						break;
				case 14:str="ѧϰ�Ķ�";
						clf = new Classification(14,51, 52, 53, 54, "������", "����", "����", "��־","ѧϰ�Ķ�");
						break;
				default:break;
				}
				int total = appInfoDAO.findByCategoryNum(1, str);
				PageUtil page = new PageUtil(appTmp.getShowByCategoryCurrentPage(), total);
				page.setPageSize(16);
				List<AppInfo> appInfo = appInfoDAO.findByCategory(1, str, appTmp.getShowByCategoryCurrentPage(), page.getPageSize());
				List<App> app = new ArrayList<App>();
				for (int i = 0; i < appInfo.size(); i++) {
					AppInfo info = appInfo.get(i);
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					app.add(new App(info,source,authority));
				}
				List<AppInfo> topApp = appInfoDAO.findByCategory(1, str, 1, 18);// �����Ƽ�
				List<App> topRecommended = new ArrayList<App>();
				for (int i = 0; i < topApp.size(); i++) {
					AppInfo info = topApp.get(i);
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					topRecommended.add(new App(info,source,authority));
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("topRecommended", topRecommended);
				request.put("page", page);
				request.put("clf", clf);
				request.put("str", str);
				request.put("category", category);
				return Action.SUCCESS;

			}
			
			/**���ݾ��������ʾ��Ϸ��Ӧ��
			 * 1 ��ͨ,2 ��������3  ���㣬4  ����
			 * 5 �����6  ��� ��7 ̹�ˣ� 8 ���� 
			 * 9�ֻ��� 10���� 11���� 12̨��
			 * 13��������14 �齫�� 15ֽ�ƣ� 16ƴͼ
			 * 17��Ӫ ��18���ƣ� 19������20 ս��
			 * 21 �ܿᣬ 22 ��棬 23 3D�� 24����
			 * 25�غ��ƣ� 26���� ��27���ã� 28����
			 * 29�Ż��� 30���� ��31��ȫ ��32ɱ��
			 * 33������� 34���뷨 ��35�ļ��� 36�칫 
			 * 37���⣬,38���棬 39��ֽ�� 40���
			 * 41���֣� 42��Ƶ ��43��� ��44������
			 * 45������46 ��� 47��ƣ� 48����
			 * 49���죬 50���� ��51΢����52 ����
			 * 53�����飬 54������ 55���ţ� 56��־
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String webShowByClassification(){
				String str="";
				switch(classification){
				case 1:str="��ͨ";
				clf = new Classification(1,1, 2, 3, 4, "��ͨ", "������", "����", "����","��������");
				break;
				case 2:str="������";
				clf = new Classification(1,1, 2, 3, 4, "��ͨ", "������", "����", "����","��������");
				break;
				case 3:str="����";
				clf = new Classification(1,1, 2, 3, 4, "��ͨ", "������", "����", "����","��������");
				break;
				case 4:str="����";
				clf = new Classification(1,1, 2, 3, 4, "��ͨ", "������", "����", "����","��������");
				break;
				case 5:str="���";
				clf = new Classification(2,5, 6, 7, 8, "���", "���", "̹��", "����","�������");
				break;
				case 6:str="���";
				clf = new Classification(2,5, 6, 7, 8, "���", "���", "̹��", "����","�������");
				break;
				case 7:str="̹��";
				clf = new Classification(2,5, 6, 7, 8, "���", "���", "̹��", "����","�������");
				break;
				case 8:str="���� ";
				clf = new Classification(2,5, 6, 7, 8, "���", "���", "̹��", "����","�������");
				break;
				case 9:str="�ֻ�";
				clf = new Classification(3,9, 10, 11, 12, "�ֻ�", "����", "����", "̨��","��������");
				break;
				case 10:str="����";
				clf = new Classification(3,9, 10, 11, 12, "�ֻ�", "����", "����", "̨��","��������");
				break;
				case 11:str="����";
				clf = new Classification(3,9, 10, 11, 12, "�ֻ�", "����", "����", "̨��","��������");
				break;
				case 12:str="̨��";
				clf = new Classification(3,9, 10, 11, 12, "�ֻ�", "����", "����", "̨��","��������");
				break;
				case 13:str="������";
				clf = new Classification(4,13, 14, 15, 16, "������", "�齫", "ֽ��", "ƴͼ","��������");
				break;
				case 14:str="�齫";
				clf = new Classification(4,13, 14, 15, 16, "������", "�齫", "ֽ��", "ƴͼ","��������");
				break;
				case 15:str="ֽ��";
				clf = new Classification(4,13, 14, 15, 16, "������", "�齫", "ֽ��", "ƴͼ","��������");
				break;
				case 16:str="ƴͼ";
				clf = new Classification(4,13, 14, 15, 16, "������", "�齫", "ֽ��", "ƴͼ","��������");
				break;
				case 17:str="��Ӫ";
				clf = new Classification(5,17, 18, 19, 20, "��Ӫ", "����", "����", "ս��","���Ծ�Ӫ");
				break;
				case 18:str="����";
				clf = new Classification(5,17, 18, 19, 20, "��Ӫ", "����", "����", "ս��","���Ծ�Ӫ");
				break;
				case 19:str="����";
				clf = new Classification(5,17, 18, 19, 20, "��Ӫ", "����", "����", "ս��","���Ծ�Ӫ");
				break;
				case 20:str="ս��";
				clf = new Classification(5,17, 18, 19, 20, "��Ӫ", "����", "����", "ս��","���Ծ�Ӫ");
				break;
				case 21:str="�ܿ�";
				clf = new Classification(6,21, 22, 23, 24, "�ܿ�", "���", "3D", "����","���ٶ���");
				break;
				case 22:str="���";
				clf = new Classification(6,21, 22, 23, 24, "�ܿ�", "���", "3D", "����","���ٶ���");
				break;
				case 23:str="3D";
				clf = new Classification(6,21, 22, 23, 24, "�ܿ�", "���", "3D", "����","���ٶ���");
				break;
				case 24:str="����";
				clf = new Classification(6,21, 22, 23, 24, "�ܿ�", "���", "3D", "����","���ٶ���");
				break;
				case 25:str="�غ���";
				clf = new Classification(7,25, 26, 27, 28, "�غ���", "����", "����", "����","��ɫ����");
				break;
				case 26:str="����";
				clf = new Classification(7,25, 26, 27, 28, "�غ���", "����", "����", "����","��ɫ����");
				break;
				case 27:str="����";
				clf = new Classification(7,25, 26, 27, 28, "�غ���", "����", "����", "����","��ɫ����");
				break;
				case 28:str="����";
				clf = new Classification(7,25, 26, 27, 28, "�غ���", "����", "����", "����","��ɫ����");
				break;
				case 29:str="�Ż�";
				clf = new Classification(8,29, 30, 31, 32, "�Ż�", "����", "��ȫ", "ɱ��","ϵͳ��ȫ");
				break;
				case 30:str="����";
				clf = new Classification(8,29, 30, 31, 32, "�Ż�", "����", "��ȫ", "ɱ��","ϵͳ��ȫ");
				break;
				case 31:str="��ȫ";
				clf = new Classification(8,29, 30, 31, 32, "�Ż�", "����", "��ȫ", "ɱ��","ϵͳ��ȫ");
				break;
				case 32:str="ɱ��";
				clf = new Classification(8,29, 30, 31, 32, "�Ż�", "����", "��ȫ", "ɱ��","ϵͳ��ȫ");
				break;
				case 33:str="�����";
				clf = new Classification(9,33, 34, 35, 36, "�����", "���뷨", "�ļ�", "�칫","���ù���");
				break;
				case 34:str="���뷨";
				clf = new Classification(9,33, 34, 35, 36, "�����", "���뷨", "�ļ�", "�칫","���ù���");
				break;
				case 35:str="�ļ�";
				clf = new Classification(9,33, 34, 35, 36, "�����", "���뷨", "�ļ�", "�칫","���ù���");
				break;
				case 36:str="�칫";
				clf = new Classification(9,33, 34, 35, 36, "�����", "���뷨", "�ļ�", "�칫","���ù���");
				break;
				case 37:str="����";
				clf = new Classification(10,37, 38, 39, 40, "����", "����", "��ֽ", "���","��Ӱ����");
				break;
				case 38:str="����";
				clf = new Classification(10,37, 38, 39, 40, "����", "����", "��ֽ", "���","��Ӱ����");
				break;
				case 39:str="��ֽ";
				clf = new Classification(10,37, 38, 39, 40, "����", "����", "��ֽ", "���","��Ӱ����");
				break;
				case 40:str="���";
				clf = new Classification(10,37, 38, 39, 40, "����", "����", "��ֽ", "���","��Ӱ����");
				break;
				case 41:str="����";
				clf = new Classification(11,41, 42, 43, 44, "����", "��Ƶ", "���", "������","Ӱ��ͼ��");
				break;
				case 42:str="��Ƶ";
				clf = new Classification(11,41, 42, 43, 44, "����", "��Ƶ", "���", "������","Ӱ��ͼ��");
				break;
				case 43:str="���";
				clf = new Classification(11,41, 42, 43, 44, "����", "��Ƶ", "���", "������","Ӱ��ͼ��");
				break;
				case 44:str="������";
				clf = new Classification(11,41, 42, 43, 44, "����", "��Ƶ", "���", "������","Ӱ��ͼ��");
				break;
				case 45:str="����";
				clf = new Classification(12,45, 46, 47, 48, "����", "����", "���", "����","�������");
				break;
				case 46:str="����";
				clf = new Classification(12,45, 46, 47, 48, "����", "����", "���", "����","�������");
				break;
				case 47:str="���";
				clf = new Classification(12,45, 46, 47, 48, "����", "����", "���", "����","�������");
				break;
				case 48:str="����";
				clf = new Classification(12,45, 46, 47, 48, "����", "����", "���", "����","�������");
				break;
				case 49:str="����";
				clf = new Classification(13,49, 50, 51, 52, "����", "����", "΢��", "����","�罻ͨ��");
				break;
				case 50:str="����";
				clf = new Classification(13,49, 50, 51, 52, "����", "����", "΢��", "����","�罻ͨ��");
				break;
				case 51:str="΢��";
				clf = new Classification(13,49, 50, 51, 52, "����", "����", "΢��", "����","�罻ͨ��");
				break;
				case 52:str="����";
				clf = new Classification(13,49, 50, 51, 52, "����", "����", "΢��", "����","�罻ͨ��");
				break;
				case 53:str="������";
				clf = new Classification(14,51, 52, 53, 54, "������", "����", "����", "��־","ѧϰ�Ķ�");
				break;
				case 54:str="����";
				clf = new Classification(14,51, 52, 53, 54, "������", "����", "����", "��־","ѧϰ�Ķ�");
				break;
				case 55:str="����";
				clf = new Classification(14,51, 52, 53, 54, "������", "����", "����", "��־","ѧϰ�Ķ�");
				break;
				case 56:str="��־";
				clf = new Classification(14,51, 52, 53, 54, "������", "����", "����", "��־","ѧϰ�Ķ�");
				break;
				default:str="��־";
				clf = new Classification(14,51, 52, 53, 54, "������", "����", "����", "��־","ѧϰ�Ķ�");
				break;
				}
				int total = appInfoDAO.findByClassificationNum(1, str);
				PageUtil page = new PageUtil(appTmp.getShowByClassificationCurrentPage(), total);
				List<AppInfo> appInfo = appInfoDAO.findByClassification(1, str, 
						appTmp.getShowByClassificationCurrentPage(), page.getPageSize());
				List<App> app = new ArrayList<App>();
				for (int i = 0; i < appInfo.size(); i++) {
					AppInfo info = appInfo.get(i);
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					app.add(new App(info,source,authority));
				}
				List<AppInfo> topApp = appInfoDAO.findByCategory(1, clf.getStrCat(), 1, 18);// �����Ƽ�
				List<App> topRecommended = new ArrayList<App>();
				for (int i = 0; i < topApp.size(); i++) {
					AppInfo info = topApp.get(i);
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					topRecommended.add(new App(info,source,authority));
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("topRecommended", topRecommended);
				request.put("str", str);
				request.put("clf", clf);
				request.put("page", page);
				request.put("classification", classification);
				return Action.SUCCESS;
			}
			
			/**ǰ̨��ʾ�Ƽ���Ӧ��
			 * @return
			 */
			@SuppressWarnings({ "unchecked", "rawtypes" })
			public String showByRecomLevel(){
				int total = appAutDAO.findByRecomLevelNum(0);
				PageUtil page = new PageUtil(appTmp.getShowByRecomLevelCurrentPage(), total);
				page.setPageSize(15);
				List<AppAuthority> appAut = appAutDAO.findByRecomLevel(0, appTmp.getShowByRecomLevelCurrentPage(), page.getPageSize());
				List<App> app = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					app.add(new App(info,source,authority));
					
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("page", page);
				return Action.SUCCESS;
			}
			
			/**ǰ̨�������ֺ�����������
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String showByScoreAndDown(){
				int total  = appAutDAO.findByScoreAndDownNum(0);
				PageUtil page = new PageUtil(appTmp.getShowByScoreAndDownCurrentPage(), total);
				page.setPageSize(15);
				List<AppAuthority> appAut = appAutDAO.findByScoreAndDown(0, appTmp.getShowByScoreAndDownCurrentPage(), page.getPageSize());
				List<App> app = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					app.add(new App(info,source,authority));			
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("page", page);
				return Action.SUCCESS;
			}
			
			
			/**
			 * �����Ƽ�
			 * ��׿��Ʒ �Ƽ����� > ���� > ������
			 * �����Ƽ�->����
			 * �������а�->�Ƽ�����
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String todayRecommend(){
				Map request = (Map) ActionContext.getContext().get("request");
				/*************************��׿��Ʒ*****************************/
				List<AppAuthority> appAut = appAutDAO.findByBoutique(0,0,1,36);
				List<App> appBoutique = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appBoutique.add(new App(info,source,authority));			
				}
				/***********************************************************/
				
				/*************************�����Ƽ�******************************/
				appAut = appAutDAO.findByScoreAndDown(0, 1, 12);
				List<App> appRecommend = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appRecommend.add(new App(info,source,authority));			
				}
				/***********************************************************/
				
				/************************�������а�******************************/
				appAut = appAutDAO.findByRecomLevel(0, 1, 12);
				List<App> appRank = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appRank.add(new App(info,source,authority));			
				}
				/***********************************************************/
				
				request.put("appBoutique", appBoutique);
				request.put("appRecommend", appRecommend);
				request.put("appRank", appRank);
				return Action.SUCCESS;
				
			}
			
			/**
			 * ��׿Ӧ������->Ӧ��->�Ƽ����� > ���� > ������ > ����ʱ��
			 * Ӧ����������
			 * 
			 * ��׿��Ϸ����->��Ϸ->�Ƽ����� > ���� > ������ > ����ʱ��
			 * ��Ϸ��������
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String webRanklist(){
				Map request = (Map) ActionContext.getContext().get("request");
				/*************************��׿Ӧ������*****************************/
				List<AppAuthority> appAut = appAutDAO.findByTypeRank("Ӧ��", 0, 0, 1, 18);
				List<App> appApplication = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appApplication.add(new App(info,source,authority));			
				}
				/*************************************************************/
				
				/*************************Ӧ����������*****************************/
				appAut = appAutDAO.findByTypeRank("Ӧ��", 0, 0, 1, 10);
				List<App> applicationPopularity = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					applicationPopularity.add(new App(info,source,authority));			
				}
				/*************************************************************/
				
				/*************************��׿��Ϸ����*****************************/
				appAut = appAutDAO.findByTypeRank("��Ϸ", 0, 0, 1, 18);
				List<App> appGame = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appGame.add(new App(info,source,authority));			
				}
				/*************************************************************/
				
				/*************************��׿��Ϸ����*****************************/
				appAut = appAutDAO.findByTypeRank("��Ϸ", 0, 0, 1, 10);
				List<App> gamePopularity = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					gamePopularity.add(new App(info,source,authority));			
				}
				/*************************************************************/
				request.put("appApplication", appApplication);
				request.put("applicationPopularity", applicationPopularity);
				request.put("appGame", appGame);
				request.put("gamePopularity", gamePopularity);
				return Action.SUCCESS;
				
			}
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String rankMore(){
				int total;
				PageUtil page;
				List<App> app=new ArrayList<App>();
				List<AppAuthority> appAut;
				/*************************Ӧ�ø�������*******************************/
				if(rankMoreType == 1){
					total = appAutDAO.findByTypeRankNum("Ӧ��", 0, 0);
					page = new PageUtil(rankMoreCurrentPage, total);
					page.setPageSize(16);
					appAut = appAutDAO.findByTypeRank("Ӧ��", 0, 0, rankMoreCurrentPage, page.getPageSize());
					
				}
				/*************************��Ϸ��������*******************************/
				else {
					total = appAutDAO.findByTypeRankNum("Ӧ��", 0, 0);
					page = new PageUtil(rankMoreCurrentPage, total);
					page.setPageSize(16);
					appAut = appAutDAO.findByTypeRank("��Ϸ", 0, 0, rankMoreCurrentPage, page.getPageSize());
				
				}
				/***************************************************************/
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					app.add(new App(info,source,authority));			
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("page", page);
				if(rankMoreType == 1)
					return "rankMoreApp";
				else 
					return "rankMoreGame";
				
			}
			
			/**
			 * ��������������
			 * �Ƽ����� > ���� > ������ > ����ʱ��
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String rankByKeyword(){
				
				int total = appInfoDAO.findByClassificationNum(1, keyword);
				PageUtil page = new PageUtil(rankMoreCurrentPage, total);
				page.setPageSize(16);
				System.out.println("keyword"+keyword+"\ntotal"+total);
				List<AppInfo> appInfo = appInfoDAO.findByClassification(1, keyword, 
						rankMoreCurrentPage, page.getPageSize());
				List<App> app = new ArrayList<App>();
				for (int i = 0; i < appInfo.size(); i++) {
					AppInfo info = appInfo.get(i);
					System.out.println(info.getAppName());
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					app.add(new App(info,source,authority));
					System.out.println(app.get(i).getAppInfo().getAppName());
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("page", page);
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("keyword", keyword);
				int type = 1;
				String []key={"�Ż�","����","��ȫ","ɱ��","�����",
								"���뷨","�ļ�","�칫","����","����",
								"��ֽ","���","����","��Ƶ","���",
								"������","����","����","���","����",
								"����","����","΢��","����","������",
								"����","����","��־"
								};
				for(int i=0;i<key.length;i++)
					if(key[i].equals(keyword))
						type = 0;
				if(type==0)
					return "rank_moreApp";
				else return "rank_moreGame";
				
			}

			/**apkӦ�õľ�����Ϣ
			 * �����û�����Ӧ�õ����classification���Ƽ�����Ӧ��
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String details(){
				//��ʾӦ�õľ�����Ϣ
				AppInfo info = appInfoDAO.findById(apkId);
				AppAuthority aut = appAutDAO.findById(apkId);
				AppSource sou = appSouDAO.findById(apkId);
				App app = new App(info,sou,aut);
				List<Review> review = reviewDAO.findByAppId(apkId);
				app.setReview(review);
				HttpSession httpSession = ServletActionContext.getRequest()
						.getSession();
				httpSession.setAttribute("app", app);
				
				//�Ƽ�����Ӧ��
				List<AppAuthority> appAut = appAutDAO.findByClassification(info.getClassification(),apkId, 0, 0, 1, 5);
				List<App> appOthers = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority appAuthority = appAut.get(i);
					AppInfo appInfo = appInfoDAO.findById(appAuthority.getId());
					AppSource appSource = appSouDAO.findById(appAuthority.getId());
					appOthers.add(new App(appInfo,appSource,appAuthority));			
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("appOthers", appOthers);
				return Action.SUCCESS;
			}
			
			
			public String getKeyword() {
				return keyword;
			}

			public void setKeyword(String keyword) {
				this.keyword = keyword;
			}

			public int getRankMoreCurrentPage() {
				return rankMoreCurrentPage;
			}

			public void setRankMoreCurrentPage(int rankMoreCurrentPage) {
				this.rankMoreCurrentPage = rankMoreCurrentPage;
			}

			public int getRankMoreType() {
				return rankMoreType;
			}

			public void setRankMoreType(int rankMoreType) {
				this.rankMoreType = rankMoreType;
			}

			public Classification getClf() {
				return clf;
			}

			public void setClf(Classification clf) {
				this.clf = clf;
			}

			public int getType() {
				return type;
			}

			public void setType(int type) {
				this.type = type;
			}

			public int getClassification() {
				return classification;
			}

			public void setClassification(int classification) {
				this.classification = classification;
			}

			public int getCategory() {
				return category;
			}

			public void setCategory(int category) {
				this.category = category;
			}

			public int getDownLoadId() {
				return downLoadId;
			}

			public void setDownLoadId(int downLoadId) {
				this.downLoadId = downLoadId;
			}

			public int getApkId() {
				return apkId;
			}

			public void setApkId(int apkId) {
				this.apkId = apkId;
			}

			public AppAuthority getAppAut() {
				return appAut;
			}
			public void setAppAut(AppAuthority appAut) {
				this.appAut = appAut;
			}
			public AppInfo getAppInfo() {
				return appInfo;
			}
			public void setAppInfo(AppInfo appInfo) {
				this.appInfo = appInfo;
			}
			public AppSource getAppSou() {
				return appSou;
			}
			public void setAppSou(AppSource appSou) {
				this.appSou = appSou;
			}
			public AppTmp getAppTmp() {
				return appTmp;
			}
			public void setAppTmp(AppTmp appTmp) {
				this.appTmp = appTmp;
			}

			public WebAction(AppAutDAO appAutDAO, AppInfoDAO appInfoDAO,
					AppSouDAO appSouDAO, ReviewDAO reviewDAO) {
				super();
				this.appAutDAO = appAutDAO;
				this.appInfoDAO = appInfoDAO;
				this.appSouDAO = appSouDAO;
				this.reviewDAO = reviewDAO;
			}
			
			
}
