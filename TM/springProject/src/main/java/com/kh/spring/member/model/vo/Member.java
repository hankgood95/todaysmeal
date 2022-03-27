package com.kh.spring.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/* lombok 
 * 자바에서 VO 클래스를 만들 때 필드에 대한 getter/setter, toString, 생성자
 * 등 반드시 필요하고 반복적으로 해야할 코드를 어노테이션을 통해 간단하게
 * 줄여주는 라이브러리
 * 
 * 해당 라이브러리를 이용하면 필드 수정 시 일일히 set/getter, constructor, toString
 * 수정할 필요가 없어진다.
 * 
 * 1. Maven을 통해 라이브러리 dependency 추가
 * 2. 다운로드로만은 사용할 수 없고 설치가 필요하다 -> 해당 jar 파일 위치의 폴더 찾아가기
 * 3. eclipse.exe 경로 잡아서 install and update 클릭
 * 4. 이클립스 재부팅
 * 5. 어노테이션으로 이용
 * 
 * */
@NoArgsConstructor // 인자 없는 생성자(기본 생성자)
@AllArgsConstructor // 모든 인자를 가진 생성자(매개변수 생성자)
@Setter
@Getter
@ToString
@EqualsAndHashCode
// @Data -> 위의 내용들을 한번에 처리해주는 어노테이션
// 단, 매개변수 생성자는 제외
public class Member {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String gender;
	private int age;
	private String phone;
	private String address;
	private Date enrollDate;
	private Date updateDate;
	private String mStatus;
	
	/*public Member() {}

	public Member(String id, String pwd, String name, String email, String gender, int age, String phone,
			String address, Date enrollDate, Date updateDate, String mStatus) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.mStatus = mStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", gender=" + gender
				+ ", age=" + age + ", phone=" + phone + ", address=" + address + ", enrollDate=" + enrollDate
				+ ", updateDate=" + updateDate + ", mStatus=" + mStatus + "]";
	}*/
}
