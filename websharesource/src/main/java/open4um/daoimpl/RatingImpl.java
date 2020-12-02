package  open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.RatingDao;
import  open4um.vo.Rating;

@Repository
public class RatingImpl implements RatingDao{

	@Override
	public Rating avgStart(int sourceid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Rating rating = session.selectOne("mappers.ratingMapper.avgStart",sourceid);
		session.commit();
		session.close();
		return rating;
		 
	}

	@Override
	public List<Rating> countSumStart(int sourceid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Rating> rating = session.selectList("mappers.ratingMapper.countSumStart",sourceid);
		session.commit();
		session.close();
		return rating;
	}

	@Override
	public int uploadRating(Rating rating) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		int row = session.insert("mappers.ratingMapper.uploadRating", rating);
		session.commit();
		session.close();
		return row;
	}

}
