package ajax;

import com.ta.dao.MemberDao;

public class DaoTest {

	public static void main(String[] args) {
		MemberDao mDao = new MemberDao();
		/*String id="ta";
		String pw = "1234";*/
		//System.out.println(mDao.getCheck(id,pw));
		String id="ys";
		String pw="1234";
		String name="tatata";
//		mDao.insertMember(id,pw,name);
		
		//System.out.println(mDao.getCheck(id, pw));
		
//		mDao.getName(id);
//		mDao.getPoint(id);
		
		int point = 1000;
		
		//mDao.UpdatePoint(point, id);
		//System.out.println(mDao.getMember());
		mDao.DeleteMember(id);
//		mDao.getModify(id, pw, name, point);
	}
}
