package  open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import  open4um.daoimpl.RatingImpl;
import  open4um.vo.Rating;

@Service
public class RatingService {
	@Autowired
	private RatingImpl ratingImpl;
	public Rating avgStart(int sourceid) {
		return ratingImpl.avgStart(sourceid);
	}
	public List<Rating> countSumStart(int sourceid){
		return ratingImpl.countSumStart(sourceid);
	}
	public int uploadRating(Rating rating) {
		return ratingImpl.uploadRating(rating);
	}
}
