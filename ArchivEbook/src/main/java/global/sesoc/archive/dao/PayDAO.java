package global.sesoc.archive.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.archive.controller.PayController;
import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.ReadBookVO;

@Repository
public class PayDAO {

	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	public void setBuy_user(HashMap<String, Object> map) {
		PayMapper mapper = sqlSession.getMapper(PayMapper.class);
		Buy_userVO want = mapper.getWantBook(map);//	WANT값이 1이고 책이름과 아이디가 동일한 사람의 책이 있나 확인
		logger.debug("{}",map.get("used"));
		int num = (int)map.get("used");
		if(want == null){							//없을 경우 0은 새로운 구매 1은 연장 2는 이전에 있던 거
			if(num != 1){
				mapper.setBuy_user(map);//
				if(num == 0){
					logger.debug("새롭게 구매");
					mapper.setReadBook(map);//
				}
				else{
					logger.debug("옛날에 대여했던 책");
					mapper.updateReadbook(map);//
				}
			}
			else{
				logger.debug("연장");
				mapper.updateBook(map);	//연장한다.
			}
		}
		else{
			logger.debug("찜목록");				//있을 경우 > 찜목록 업데이트 이후 readbook에 새로이 세팅
			mapper.updateWant(map);//
			mapper.setReadBook(map);//
		}
	}

	public void setUsed_data(HashMap<String, Object> map) {
		PayMapper mapper = sqlSession.getMapper(PayMapper.class);
		mapper.setUsed_data(map);//
	}
}
