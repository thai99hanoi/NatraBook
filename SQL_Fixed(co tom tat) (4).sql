
CREATE DATABASE Book_Seller1
GO
USE Book_Seller1
GO
CREATE TABLE SACH
(
	MaSach INT NOT NULL PRIMARY KEY, -- Mã sách
	TenSach NVARCHAR(100), -- Tên sách
	MaLoaiSach INT, -- Tham chiếu đến THELOAI
	MaNXB INT, -- Tham chiếu đến NXB
	GiaNhap DECIMAL(20,1), -- Giá tiền của sách
	GiaBia DECIMAL(20,1),
	SoLuong INT,
	GhiChuSach NVARCHAR(max),
	TomTat NVARCHAR(max),
	AnhSach NVARCHAR(200)
);
GO

CREATE TABLE THELOAI
(
	MaLoaiSach INT NOT NULL PRIMARY KEY,--Mã thể loại
	TenLoaiSach NVARCHAR(50) -- Tên thể loại
);
GO

CREATE TABLE CHITIETSACH
(
	MaChiTietSach NVARCHAR(20) PRIMARY KEY,
	MaSach INT,
	MaNgonNgu NVARCHAR(20),
	TongSoTrang INT,
	TrongLuong DECIMAL(18,1),
	KichThuoc NVARCHAR(50),
	NamXuatBan DATE

);
GO

CREATE TABLE NGONNGU
(
	MaNgonNgu NVARCHAR(20) NOT NULL PRIMARY KEY,
	TenNgonNgu NVARCHAR(20)
);
GO

CREATE TABLE TACGIA
(
	MaTacGia INT NOT NULL PRIMARY KEY,
	TenTacGia NVARCHAR(50), 
	NgheNghiep NVARCHAR(50),
	GhiChuTG NVARCHAR(max),
	TomTat NVARCHAR(max),
	AnhTacGia NVARCHAR(200)

);
GO


CREATE TABLE SACHvaTACGIA
(
	MaSach INT NOT NULL,
	MaTacGia INT NOT NULL,
	PRIMARY KEY (MaSach,MaTacGia)
);
GO

CREATE TABLE NXB
(
	MaNXB INT NOT NULL PRIMARY KEY, -- Mã nhà xuất bản
	TenNXB NVARCHAR(100), -- Tên nhà xuất bản
	DiaChi NVARCHAR(200),
	Email NVARCHAR(50),
	SDT NVARCHAR(20)
);
GO


CREATE TABLE KHACHHANG 
(
	MaKhachHang INT NOT NULL PRIMARY KEY,
	HoTen NVARCHAR(50), 
	GioiTinh NVARCHAR(3) CONSTRAINT CK_KHACHHANG_GIOITINH CHECK (GioiTinh = N'Nam' OR GioiTinh = N'Nữ'),
	Email NVARCHAR(50),
	DiaChi NVARCHAR(200), 
	SDT NVARCHAR(11), 
	TaiKhoan NVARCHAR(30),
	MK NVARCHAR(30),
	NgayDK DATE,
	Avatar nvarchar(100)
);
GO

CREATE TABLE DONHANG
(
	MaDonHang INT NOT NULL PRIMARY KEY,
	MaKhachHang INT,
	ThoiGianDat DATE,
	ThoiGianGiao DATE,
	DiaChi NVARCHAR(200), -- Địa chỉ đặt hàng
	NguoiNhan NVARCHAR(30),
	TinhTrang NCHAR(30),
	GhiChu NVARCHAR(50),
);
GO

CREATE TABLE CHITIETDONHANG
(
	MaSach INT NOT NULL,
	MaDonHang INT NOT NULL,
	SoLuong INT,
	DonGia DECIMAL(18,1),
	PRIMARY KEY (MaSach, MaDonHang)
);
GO

ALTER TABLE dbo.CHITIETDONHANG
ADD CONSTRAINT FK_CHITIETDONHANG_DONHANG FOREIGN KEY (MaSach) REFERENCES dbo.SACH (MaSach),
	CONSTRAINT FK_CHITIETDONHANG_SACH FOREIGN KEY (MaDonHang) REFERENCES dbo.DONHANG (MaDonHang);
GO

ALTER TABLE dbo.CHITIETSACH
ADD CONSTRAINT FK_CHITIETSACH_SACH FOREIGN KEY (MaSach) REFERENCES dbo.SACH (MaSach);
GO

ALTER TABLE dbo.DONHANG
ADD CONSTRAINT FK_DONHANG_KHACHHANG FOREIGN KEY (MaKhachHang) REFERENCES dbo.KHACHHANG(MaKhachHang);
GO

ALTER TABLE dbo.SACH
ADD CONSTRAINT FK_SACH_NXB FOREIGN KEY (MaNXB) REFERENCES dbo.NXB(MaNXB),
	CONSTRAINT FK_SACH_LOAISACH FOREIGN KEY (MaLoaiSach) REFERENCES  dbo.THELOAI (MaLoaiSach);
GO

ALTER TABLE dbo.CHITIETSACH
ADD CONSTRAINT FK_NGONNGU_CHITIETSACH FOREIGN KEY (MaNgonNgu) REFERENCES dbo.NGONNGU (MaNgonNgu);
GO

ALTER  TABLE dbo.SACHvaTACGIA
ADD CONSTRAINT FK_SACHvaTACGIA_SACH FOREIGN KEY (MaSach) REFERENCES dbo.SACH(MaSach),
	CONSTRAINT FK_SACHvaTACGIA_TACGIA FOREIGN KEY (MaTacGia) REFERENCES dbo.TACGIA (MaTacGia)
GO

------------------------------------INSERT DATA------------------------------------------


INSERT INTO	dbo.TACGIA
VALUES 
(1,		N'Nguyễn Nhật Ánh', N'Nhà Văn', N'Nguyễn Nhật Ánh là tên và cũng là bút danh của một nhà văn Việt Nam chuyên viết cho tuổi mới lớn. Ông sinh ngày 7 tháng 5 năm 1955 tại huyện Thăng Bình, Quảng Nam. Năm 13 tuổi ông đăng báo bài thơ đầu tiên. Tác phẩm đầu tiên in thành sách là một tập thơ: Thành phố tháng tư (NXB Tác phẩm mới - 1984 - in chung với Lê Thị Kim). Truyện dài đầu tiên của ông là tác phẩm Trước vòng chung kết (NXB Măng Non, 1985). Hai mươi năm trở lại đây, ông tập trung viết văn xuôi, chuyên sáng tác về đề tài thanh thiếu niên.
Năm 2003, bộ truyện nhiều tập Kính vạn hoa được Trung ương Đoàn TNCS HCM trao huy chương Vì thế hệ trẻ và được Hội nhà văn Việt Nam trao tặng thưởng. Đến nay ông đã xuất bản gần 100 tác phẩm và từ lâu đã trở thành nhà văn thân thiết của các bạn đọc nhỏ tuổi ở Việt Nam. Năm 2008, Nguyễn Nhật Ánh xuất bản truyện có tên Cho tôi xin một vé đi tuổi thơ, tác phẩm này được báo Người Lao động bình chọn là tác phẩm hay nhất năm 2008. Đoạt giải thưởng văn học ASEAN năm 2010
',N'Nguyễn Nhật Ánh là tên và cũng là bút danh của một nhà văn Việt Nam chuyên viết cho tuổi mới lớn. Ông sinh ...',N'Img/NguyenNhatAnh.jpg'),
(2,		N'John Green',	N'Nhà Văn',	N'John Green: là tác giả của sách bán chạy nhất theo nhận định của New York Times, từng đoạt nhiều giải thưởng, bao gồm huy chương Printz Medal, giải thưởng Printz Honor và giải Edgar Award. Anh đã hai lần lọt vào chung kết giải thưởng sách của LA Times. Cùng với em trai mình - Hank - John là đồng tác giả của trang nhật ký điện tử Vlogbrothers (youtube.com/vlogbrothers), một trong những trang video trực tuyến phổ biến nhất thế giới. Bạn có thể tham gia vào hàng ngũ 1,1 triệu người đang theo dõi John trên Twitter (@realjohngreen), hoặc ghé thăm trang web của anh tại johngreenbooks.com.
Hiện John sống với vợ và con trai tại Indianapolis, bang Indiana.',N'John Green: là tác giả của sách bán chạy nhất theo nhận định của New York Times, từng đoạt nhiều giải ...',N'Img/JohnGreen.jpg'),
(3,		N'Suzanne Collins',	N'Nhà Văn',	N'Suzanne Collins: Tác giả trẻ Suzanne Collins sinh ngày 10-8-1962 tại Thành phố Hartford, bang Connecticut- Hoa Kỳ. Là Tác giả trẻ sinh thuộc cung Sư Tử, cầm tinh con (giáp) hổ (Nhâm Dần 1962). Suzanne Collins xếp hạng nổi tiếng thứ 5157 trên thế giới và thứ 6 trong danh sách Tác giả trẻ nổi tiếng.',N'Suzanne Collins: Tác giả trẻ Suzanne Collins sinh ngày 10-8-1962 tại Thành phố Hartford, bang ...',N'Img/Unknow.jpg'),
(4,		N'Lâm Hán Cường',	N'Dịch Giả',Null,NuLL,N'Img/Unknow.jpg'),
(5,		N'Lê Huy Khoa',	N'Nhà Văn',	N'Lê Huy Khoa: Năm 1995, Lê Huy Khoa tốt nghiệp Đại học Sư phạm ngoại ngữ Hà Nội, nhưng khi ấy ở VN chưa có một trung tâm dạy tiếng Hàn hay khoa tiếng Hàn tại đại học. Cha Lê Huy Khoa (từng là một lưu học sinh VN tại Cộng hòa dân chủ nhân dân Triều Tiên) và Khoa quyết định chọn con đường tu nghiệp sinh ở Hàn Quốc, với Khoa không phải học nghề mà học tiếng Hàn là chính[2]. Anh tốt nghiệp chương trình ngôn ngữ tại Đại học Yonsei năm 1996 và sở hữu bằng thạc sĩ quản trị kinh doanh (MBA), sau đó công tác tại Đại sứ quán Việt Nam ở Hàn Quốc. Năm 2004, anh Lê Huy Khoa trở về nước bắt đầu kế hoạch thành lập một trường Hàn ngữ tại Việt Nam. Hai năm sau, trường Hàn ngữ Việt - Hàn chính thức được thành lập và anh Khoa đảm nhận chức vụ Hiệu trưởng từ đó tới nay.
Năm 1998, Lê Huy Khoa bắt tay vào làm quyển sách cho tu nghiệp sinh: "Tự học câu và từ, chú trọng đến mảng lao động, sinh hoạt tại Hàn Quốc". Tháng 10-2002, cuốn từ điển Hàn Việt với 20.000 từ ra đời, đúng kỷ niệm 10 năm thiết lập quan hệ ngoại giao hai nước Việt Nam - Hàn Quốc. Tháng 3-2003, quyển Từ điển Hàn - Việt được xuất bản tại VN. Tháng 4-2003, một nhà xuất bản Hàn Quốc đã mua bản quyền quyển sách này để phát hành tại Hàn Quốc. 
Lê Huy Khoa hiện cũng là phiên dịch viên cao cấp tiếng Hàn ở Việt Nam trong các cuộc gặp cấp cao của lãnh đạo hai nước Việt Nam - Hàn Quốc. 
Đáng chú ý Lê Huy Khoa từng giảng dạy ở Pleiku (Gia Lai) từ năm 2007 và quen biết với cầu thủ Công Phượng.',N'Lê Huy Khoa: Năm 1995, Lê Huy Khoa tốt nghiệp Đại học Sư phạm ngoại ngữ Hà Nội, nhưng khi ấy ở VN chưa có một trung ...',N'Img/Unknow.jpg'),
(6,		N'J. K. Rowling',	N'Nhà Văn',	N'J.K Rowling là bút danh của Joanne "Jo" Rowling, sinh ngày 31/7/1965, cư ngụ tại thủ đô Edinburgh,Scotland là tiểu thuyết gia người Anh, tác giả bộ truyện giả tưởng nổi tiếng Harry Pottervới bút danh J. K. Rowling.
Bộ sách này được hàng triệu độc giả già trẻ trên thế giới yêu thích, nhận được nhiều giải thưởng liên tiếp và đến năm 2005 bán được 300 triệu bản trên toàn thế giới. Vào năm 2006, tạp chí Forbes xem bà là người phụ nữ giàu thứ hai trong lĩnh vực nghệ thuật giải trí chỉ sau Oprah Winfrey. Năm 2007, sau thành công vang dội của truyện Harry Potter 7 và phim Harry Potter 5, bà được tạp chí US Entertainment Weekly là 1 trong 25 nghệ sĩ của năm 2007. Bà đã được trao huân chương Bắc Đẩu Bội tinh vào ngày 3 tháng 2 năm 2009 vì tài năng xuất chúng về văn học thiếu nhi. Năm 2010 bà được trao Giải Văn học Hans Christian Andersen.',N'J.K Rowling là bút danh của Joanne "Jo" Rowling, sinh ngày 31/7/1965, cư ngụ tại thủ đô ...',N'Img/JKRowling.jpg'),
(7,		N'Mario Puzo',	N'Nhà Văn',	N'Mario Gianluigi Puzo là một nhà văn, nhà biên kịch người Mỹ, được biết đến với những tiểu thuyết về Mafia, đặc biệt là Bố già, mà sau này ông đồng chuyển thể thành một bộ phim cùng với Francis Ford Coppola. Ông đã giành được Giải Oscar cho kịch bản chuyển thể xuất sắc nhất vào giữa những năm 1972 và 1974.',N'Mario Gianluigi Puzo là một nhà văn, nhà biên kịch người Mỹ, được biết đến với những tiểu thuyết về Mafia, đặc biệt ...',N'Img/Unknow.jpg'),
(8,		N'Thảo Nguyên',	N'Dịch Giả',null,null,	N'Img/Unknow.jpg'),
(9,		N'Dương Thụy',	N'Nhà Văn',	N'Dương Thụy là nhà văn nữ của Việt Nam, được biết đến qua những bài viết trên báo Hoa Học Trò và hiện nay là cây bút khá nổi bật trên văn đàn Việt Nam.',N'Dương Thụy là nhà văn nữ của Việt Nam, được biết đến qua những bài viết trên báo Hoa Học Trò ...',N'Img/Unknow.jpg'),
(10,	N'Nathaniel Popper',N'Nhà Báo',	N'Nathaniel Popper là một nhà báo của tờ Thời báo New York về tài chính và công nghệ từ San Francisco. Trước đây ông từng làm việc cho Los Angeles Times, the Forward and Let Hãy đi Hướng dẫn du lịch. Ông tốt nghiệp Đại học Harvard năm 2002 sau khi nghiên cứu lịch sử và văn học.',N'Nathaniel Popper là một nhà báo của tờ Thời báo New York về tài chính và công nghệ từ ...',N'Img/Unknow.jpg'),
(11,	N'Paulo Coelho',	N'Nhà Văn',	N'Paulo Coelho: sinh tại Rio de Janeiro (Brasil), vào trường luật ở đó, nhưng đã bỏ học năm 1970 để du lịch qua México, Peru, Bolivia và Chile, cũng như châu Âu và Bắc Phi. Hai năm sau ông trở về Brasil và bắt đầu soạn lời cho nhạc pop. Ông cộng tác với những nhạc sĩ pop như Raul Seixas. Năm 1974 ông bị bắt giam một thời gian ngắn vì những hoạt động chống lại chế độ độc tài lúc đó ở Brasil.',N'Paulo Coelho: sinh tại Rio de Janeiro (Brasil), vào trường luật ở đó, nhưng đã bỏ học năm 1970 để du lịch qua México, ...',N'Img/Unknow.jpg'),
(12,	N'Nhiều tác giả',	N'Nhà Văn',	NULL,null,N'Img/Unknow.jpg'),
(13,	N'Victor Hugo',	N'Nhà Văn',	N'Victor Hugo (1802 - 1885) là một đại văn hào của nước Pháp vào thế kỉ 19, đồng thời cũng là một trí thức dấn thân và một chính trị gia, dùng ngòi bút để chiến đâu không mệt mỏi cho những lý tưởng của ông vào thời kì đó. Chính điều này đã khiến ông bị  lưu đày trong 20 năm. Khi mất ông được làm lễ quốc tang và thi hài được đưa vào điện Pantheon an nghỉ.

Những sáng tác của Victor Hugo chủ yếu theo trường phái lãng mạn và rất đa dạng, trong đó phải kể đến "Nhà thờ Đức Bà Paris" và "Những người khốn khổ", hai kiệt tác văn xuôi đã giúp ông trở thành một cây đại thụ của nền Văn học thế giới, khó ai có thể sánh nổi.',N'Victor Hugo (1802 - 1885) là một đại văn hào của nước Pháp vào thế kỉ 19, đồng thời cũng là một trí thức dấn thân và một ...',N'Img/VictorHugo.jpg'),
(14,	N'Jeb Blount',	N'Bán Hàng',null,null,N'Img/Unknow.jpg'),
(15,	N'Steve Case',	N'Doanh Nhân',null,null,N'Img/Unknow.jpg'),
(16,	N'Thanh Nguyên', 	N'Nhà Văn',	NULL,null,N'Img/Unknow.jpg'),
(17,	N'Guido Van Genechten',	N'Họa Sĩ',NULL,null,N'Img/Unknow.jpg'),
(18,	N'S. J. Scott',	N'Nhà Văn',	NULL,null,N'Img/Unknow.jpg'),
(19,	N'Dale Carnegie',	N'Nhà Văn',	N'Dale Breckenridge Carnegie (24/11/1888 – 1/11/1955) là một nhà văn và nhà thuyết trình Mỹ và là người phát triển các lớp tự giáo dục, nghệ thuật bán hàng, huấn luyện đoàn thể, nói trước công chúng và các kỹ năng giao tiếp giữa mọi người. 
Ra đời trong cảnh nghèo đói tại một trang trại ở Missouri, ông là tác giả cuốn Đắc Nhân Tâm, được xuất bản lần đầu năm 1936, một cuốn sách thuộc hàng bán chạy nhất và được biết đến nhiều nhất cho đến tận ngày nay. Ông cũng viết một cuốn tiểu sử Abraham Lincoln, với tựa đề Lincoln con người chưa biết, và nhiều cuốn sách khác. Carnegie là một trong những người đầu tiên đề xuất cái ngày nay được gọi là đảm đương trách nhiệm, dù nó chỉ được đề cập tỉ mỉ trong tác phẩm viết của ông. Một trong những ý tưởng chủ chốt trong những cuốn sách của ông là có thể thay đổi thái độ của người khác khi thay đổi sự đối xử của ta với họ.',N'Dale Breckenridge Carnegie (24/11/1888 – 1/11/1955) là một nhà văn và nhà thuyết trình Mỹ và là người phát triển các lớp ...',N'Img/DaleCarnegie.jpg'),
(20,	N'Tony Buổi Sáng', 	N'Nhà Văn',	N'Tony Buổi Sáng khởi đầu là một Fan Page trên Facebook, tác giả sở hữu của Fan Page này không xuất hiện nhân thân để xác định thông tin ai đang quản lý. Tony Buổi Sáng thường chia sẻ những câu chuyện trong cuộc sống, trong kinh doanh bằng cách kể chuyện hài hước, dí dỏm mà không kém phần sâu sắc. Tập hợp rất nhiều bài viết hay trên Fan Page, tuy vậy, quy định của Fan Page là không cho bình luận nên hiếm thấy bình luận nào trên trang này mặc dù số lượng thích và chia sẻ vô cùng lớn.',N'Tony Buổi Sáng khởi đầu là một Fan Page trên Facebook, tác giả sở hữu của Fan Page này không xuất hiện nhân thân để xác định thông tin ...',N'Img/TonyBuoiSang.jpg'),
(21,	N'Hạ Vũ',	N'Nhà Văn',	 NULL,null,N'Img/Unknow.jpg'),
(22,	N'Rosie Nguyễn',	N'Nhà Văn',	N'Rosie Nguyễn tên thật là Nguyễn Hoàng Nguyên, một tác giả sách, blogger/facebooker về văn hóa và du lịch, giảng viên các lớp học kỹ năng. Ngoài việc viết lách và giảng dạy thì là một người tự học, một ta ba lô, một kẻ mộng mơ và tràn đầy tình yêu cuộc sống.',N'Rosie Nguyễn tên thật là Nguyễn Hoàng Nguyên, một tác giả sách, blogger/facebooker về văn hóa và du lịch, giảng viên các lớp ...',N'Img/Unknow.jpg'),
(23,	N'Gosho Aoyama',	N'Sáng Tác Truyện Tranh',	N'Aoyama Gōshō, tên khai sinh là Aoyama Yoshimasa, sinh ngày 21 tháng 6 năm 1963 tại Hokuei tỉnh Tottori, Nhật Bản. Ông là một nhà sáng tác truyện tranh, được biết đến với bộ truyện tranh Thám tử lừng danh Conan.',N'Aoyama Gōshō, tên khai sinh là Aoyama Yoshimasa, sinh ngày 21 tháng 6 năm 1963 tại Hokuei tỉnh Tottori, Nhật Bản. Ông là một nhà sáng tác truyện tranh, được biết đến với bộ truyện ...',N'Img/Unknow.jpg'),
(24,	N'Arthur Conan Doyle',	N'Nhà Văn',	N'Sir Arthur Conan Doyle (22 tháng 5 năm 1859 – 7 tháng 7 năm 1930) là một nhà văn người Scotland nổi tiếng với tiểu thuyết trinh thám Sherlock Holmes, tác phẩm được cho là một sáng kiến lớn trong lĩnh vực tiểu thuyết trinh thám.Tên ban đầu của Sherlock Holmes vốn là Shelling Ford(Tên thám tử chưa hoàn thiện). Các tác phẩm của ông bao gồm nhiều truyện khoa học giả tưởng, tiểu thuyết lịch sử, kịch lịch sử, tiểu thuyết, thơ và bút ký.',N'Sir Arthur Conan Doyle (22 tháng 5 năm 1859 – 7 tháng 7 năm 1930) là một nhà văn người Scotland ...',N'Img/Unknow.jpg'),
(25,	N'Triệu Kiền Kiền', 	N'Nhà Văn',	 NULL,null,N'Img/Unknow.jpg'),
(26,	N'Tào Đình',	N'Nhà Văn',		N'Tào Đình, bút danh Bảo Thê, là một nhà văn nữ Trung Quốc. Cô được xem như một đại diện của thế hệ nhà văn mới Trung Quốc, biết đến với một số tác phẩm nổi bật tại Việt Nam như "Xin lỗi, em chỉ là con đĩ", "Yêu anh hơn cả tử thần", "Thiên thần sa ngã", "Hồng hạnh thổn thức", "Hôn lễ tháng ba"...',N'Tào Đình, bút danh Bảo Thê, là một nhà văn nữ Trung Quốc. Cô được xem như một đại diện của thế hệ nhà văn mới Trung Quốc, biết đến với một số tác phẩm ...', N'Img/TaoDinh.jpg'),
(27,	N'Eiichiro Oda',	N'Nhà Văn',		N'Oda Eiichiro là một họa sĩ truyện tranh người Nhật Bản, hiện đang sáng tác cho nhà xuất bản Shūeisha. Tác phẩm tiêu biểu: One Piece.',N'Oda Eiichiro là một họa sĩ truyện tranh người Nhật Bản, hiện đang sáng tác cho nhà xuất bản Shūeisha. Tác phẩm tiêu biểu: One Piece.',	N'Img/EchiroOda.jpg');
GO

INSERT INTO dbo.NXB 
VALUES 
(1,		N'NXB Trẻ',	N'TP. Hồ Chí Minh',	'hopthubandoc@nxbtre.com.vn', '(84.8) 38437450'),
(2,		N'NXB Speak', N'Anh Quốc',	'customersupport@penguinrandomhouse.co.uk',	'44 (0)1206 256000 '),
(3,		N'NXB ArtBook',	N'TP.  Hồ Chí Minh', 'info@artbook.com.vn',	'(028 39103518)'),
(4,		N'NXb Đại Học Sư Phạm',	N'TP.  Hà Nội',	'online@nxbdhsp.edu.vn', '0243.7547.735'),
(5,		N'NXB Đại học Quốc gia TPHCM',	N'TP.  Hồ Chí Minh', 'vnuhp@vnuhcm.edu.vn',	'28.6272639'),
(6,		N'NXB Dân Trí',	N'TP. Hà Nội',	'info@dantri.com.vn', '024-3736-6491'),
(7,		N'NXB đại học kinh tế quốc dân', N'TP. Hà Nội',	'nxb@neu.edu.vn', '24.36282487'),
(8,		N'NXB Thanh Niên', N'TP. Hà Nội',	'info@nxbthanhnien.vn',	'46 26 317 20'),
(9,		N'NXB Văn Học',	N'TP. Hà Nội',	'tonghopvanhoc@vnn.vn',	'(043). 7161518'),
(10,	N'NXB Hồng Đức', N'TP. Hà Nội',	'info@hongduc.vn',	'0439260024'),
(11,	N'NXB Phụ Nữ', N'TP. Hà Nội',	'truyenthongvaprnxbpn@gmail.com', '(024) 39710717'),
(12,	N'NXB Lao động', N'TP. Hà Nội',	'nxblaodong@yahoo.com',	'043.851538'),
(13,	N'NXB Tổng hợp TP.HCM',	N'TP. Hồ Chí Minh',	'tonghop@nxbhcm.com.vn', '(028) 38 256 713'),
(14,	N'NXB Hà Nội', N'TP. Hà Nội',	'nxbhanoi@yahoo.com.vn', '04.38252916'),
(15,	N'NXB Hội Nhà Văn',	N'TP. Hà Nội',	'nhaxuatbanhnv@gmail.com',	'(024) 3822.2135'),
(16,	N'NXB Kim Đồng', N'TP. Hà Nội',	'info@nxbkimdong.com.vn', '(024) 3822.9085');
GO

INSERT INTO dbo.THELOAI
VALUES
(1,	N'Sách Ngoại Văn'),
(2,	N'Sách Blockchain'),
(3,	N'Sách Kinh Tế'),
(4,	N'Sách Văn Học Trong Nước'),
(5,	N'Sách Văn Học Nước Ngoài'),
(6,	N'Sách Thường Thức - Đời Sống'),
(7,	N'Sách Thiếu Nhi'),
(8,	N'Sách Phat Triển Bản Thân'),
(9,	N'Sách Ngoại Ngữ'),
(10, N'Sách Ngôn Tình');
GO

INSERT INTO dbo.SACH
VALUES	
(1,		N'Mắt Biếc', 4,	1, 30000, 58000, 97, N'1.	Mắt Biếc : Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát)',
N'Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… ',N'Img/matbiec.jpg'),
(2,		N'The Fault in Our Stars', 1, 2, 200000, 280000, 54, N'2.	The Fault in Our Stars: Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel’s story is about to be completely rewritten.

Insightful, bold, irreverent, and raw, The Fault in Our Stars is award-winning-author John Green’s most ambitious and heartbreaking work yet, brilliantly exploring the funny, thrilling, and tragic business of being alive and in love.',N'2.	Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis…',N'Img/theFaultInOurStars.jpg'),
(3,		N'The Hunger Games Trilogy', 1,	3, 350000, 500000, 30, N'Book 1: The Hunger Games

Book 2: Catching Fire

Book 3: Mocking Jay',N'Book 1: The Hunger Games (Đấu trường sinh tử) 
Đấu trường sinh tử kể lại câu chuyện của Katniss Everdeen, một cô gái 16 tuổi từ Quận 12 đã tình nguyện làm vật tế cho Đấu trường sinh tử... ',N'Img/theHungerGamesTrilogy.jpg'),
(4,		N'Looking for Alaska', 1, 2, 150000, 220000, 101, N'The award-winning, genre-defining debut from #1 bestselling author of The Fault in Our Stars

Winner of the Michael L. Printz Award
Los Angeles Times Book Prize Finalist
New York Times bestseller

Before. Miles “Pudge” Halter is done with his safe life at home. His whole life has been one big non-event, and his obsession with famous last words has only made him crave “the Great Perhaps” even more (Francois Rabelais, poet). He heads off to the sometimes crazy and anything-but-boring world of Culver Creek Boarding School, and his life becomes the opposite of safe. Because down the hall is Alaska Young. The gorgeous, clever, funny, sexy, self-destructive, screwed up, and utterly fascinating Alaska Young. She is an event unto herself. She pulls Pudge into her world, launches him into the Great Perhaps, and steals his heart. Then. . . .

After. Nothing is ever the same.',N'Winner of the Michael L. Printz Award
Los Angeles Times Book Prize Finalist
New York Times bestseller...
',N'Img/lookingForAlaska.jpg'),
(5,		N'Giáo Trình Hán Ngữ', 9, 4, 50000, 68000, 1, N'là giáo trình biên soạn cho học viên người nước ngoài học Hán ngữ cấp tốc từ cơ bản đến nâng cao, chú trọng luyện tập kỹ năng nghe nói. Bài học trong giáo trình xoay quanh các chủ đề, bài tập có tính tập trung cao. Đặc điểm nổi bật của giáo trình là các chủ đề gần gũi cuộc sống thực tế, nội dung chân thực thú vị, ngôn ngữ sống động. Giáo trình được thiết kế nhằm phục vụ cho giáo viên, học viên dạy và học trên lớp đồng thời luyện tập các kỹ năng, giúp học viên nắm bắt ngôn ngữ Trung Quốc trong khoảng thời gian ngắn. Nội dung giáo trình được sàng lọc và sắp xếp những đề tài gần gũi với cuộc sống của học viên, học xong sử dụng được ngay, nội dung như vậy học viên thích học, muốn học. Ngôn ngữ trong bài học trôi chảy, thú vị dí dỏm, khiến học viên học tập hứng thú, khơi gợi tính tích cực học tập của học viên. Cách giảng giải các điểm ngữ pháp của giáo trình gốc sử dụng phương pháp quy nạp, bài học biên soạn không chịu sự khống chế của ngữ pháp, cho phép đưa ra điểm ngữ pháp mới. Phần bài tập của giáo trình xoay quanh bài học và các điểm ngữ pháp trong bài, nhằm vào những điểm quan trọng và điểm khó, có thể phục vụ tốt cho giáo viên chuẩn bị bài giảng, tổ chức tiết học, tiến hành tập luyện kỹ năng ngôn ngữ và kỹ năng giao tiếp cho học viên. Sách bao gồm các bài học về chủ đề: - Xin chào - Chào các bạn - Xin chào thầy (cô) - Bạn có bận không? - Bạn làm gì vào mỗi buổi tối? - Tôi đi đến nhà sách - Bạn có khỏe không - Chúng ta làm quen nhé - Ngày mai bạn có rảnh không? - Bạn đang làm gì vậy? Mỗi chủ đề đề được sắp xếp theo trình tự: Từ mới, Bài học, Bài tập, Chú thích, Bảng chữ Hán giúp các bạn dễ dàng tra cứu và học tập. Ngoài ra, tập sách còn có CD đính kèm để người học có thể tự học thêm tại nhà.'
,N'là giáo trình biên soạn cho học viên người nước ngoài học Hán ngữ cấp tốc từ cơ bản đến nâng cao, chú trọng luyện tập kỹ năng nghe nói...',N'Img/GiaoTrinhHanNgu.jpg'),
(6,		N'Luyện Phát Âm Tiếng Hàn',	9, 5, 35000, 68000,	4, N'Cung cấp các kiến thức nền tảng về ngôn ngữ tiếng Hàn như bảng chữ cái Hàn Quốc, các nguyên âm và phụ âm
Hệ thống một cách đầy đủ, chính xác và khoa học các nguyên tắc và hiện tượng phát âm tiếng Hàn với nhiều ví dụ phong phú cùng các hình thức luyện phát âm cơ bản.
Các câu và từ tiếng Hàn được dịch và chuyển âm sang tiếng Việt (thay cho phiên âm La tinh) giúp người học dễ hiểu và dễ ứng dụng.
Cách trình bày rõ ràng, dễ học và dễ tra cứu.',N'Cung cấp các kiến thức nền tảng về ngôn ngữ tiếng Hàn như bảng chữ cái Hàn Quốc, các nguyên âm và phụ âm..',N'Img/luyenphatamtiengHan.jpg'),
(7,		N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 4, 1, 100000, 175000, 51, N'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.',
N'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ ...',N'Img/P85431Escan0001.jpg'),
(8,		N'Harry Potter Boxed Set', 1, 3, 3800000, 4500000, 12, N': A beautiful boxed set containing all seven Harry Potter novels in paperback. These new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers.',
N'A beautiful boxed set containing all seven Harry Potter novels in paperback. These new editions of the classic and internationally bestselling...',N'Img/HarryPotterBoxedSet.jpg'),
(9,		N'The Godfather', 1, 3, 150000,	220000,	43,	N'The Godfather, was first published in 1969, critics hailed it as one of the greatest novels of our time, and "big, turbulent, highly entertaining." Since then, The Godfather has gone on to become a part of America national culture, as well as a trilogy of landmark motion pictures. Now, in this newly-repackaged 30th Anniversary Edition, readers old and new can experience this timeless tale of crime for themselves. From the lavish opening scene where Don Corleone entertains guests and conducts business at his daughters wedding...to his son, Michael, who takes his fathers place to fight for his family...to the bloody climax where all family business is finished, The Godfather is an epic story of family, loyalty, and how "men of honor" live in their own world, and die by their own laws.',
N': When Mario Puzo  blockbuster saga, The Godfather, was first published in 1969, critics hailed it as one of the greatest novels of our time',N'Img/TheGodfather.jpg'),
(10,	N'Tập Viết Tiếng Nhật Hiragana', 9,	6, 20000, 36000, 3, N'Trong tiếng Nhật có tất cả 3 bộ chữ cái đó là Hiragana, Katakana, cuối cùng là chữ hán kanji. Các bộ chữ cái tiếng Nhật này rất quan trọng trong quá trình học tiếng nhật. Bộ chữ Hiragana (chữ mềm) được sử dụng làm phiên âm chữ hán tự, chữ hiragan được gọi là chữ mềm vì khi chúng ta viết có cảm thấy nó rất mềm mại, hiragana là thành phần quan trọng để tạo lên chữ tiếng nhật, và mọi người bắt buộc phải học thuộc lòng bảng chữ cái tiếng Nhật này để phục vụ cho việc học tiếng Nhật sau này. Cách đọc của 2 bảng chữ cái hiragna và katakana rất dễ vì chúng theo 1 quy tắc chuẩn. Chức năng chính của hiragana chủ yếu là trật tự ngữ pháp, biểu thị mối quan hệ trong câu của chữ hán.
Tập Viết Tiếng Nhật Hiragana được biên soạn theo giáo trình bản tiếng Anh của AOTS, giúp các bạn yêu thích tiếng Nhật có thể tự học và tập viết chữ Hiragana của tiếng Nhật một cách dễ dàng.
Đây là một cuốn sách bổ ích cho những ai đang bắt đầu học tiếng Nhật. Cuốn sách giúp bạn tập viết cho bộ chữ Hiranaga. Chữ trong cuốn sách đầy đủ, in đẹp và chính xác.',N'Trong tiếng Nhật có tất cả 3 bộ chữ cái đó là Hiragana, Katakana, cuối cùng là chữ hán kanji...',N'Img/Hiragana.jpg'),
(11,	N'We ll Meet Again In San Francisco', 4, 1, 70000, 108000, 45, N'A woman nurtured a love for twenty years and didn’t expect to see the man in her dream one more time, but one day, that man suddendly came back. What did she have to do when she was torn between this childhood lover and another man who just came into her life? This story describes Sai Gon in the eighties through the memories of the protagonist, a grown-up woman. The story also describes some modern landscapes in Europe and America, for example Paris, Chicago and San Francisco.',
N'A woman nurtured a love for twenty years and didn’t expect to see the man in her dream one more time, but one day, that man suddendly came back...',N'Img/WellMeetAgainInSanFrancisco.jpg'),
(12,	N'Digital Gold - Rủ Nhau Lên Mạng Đào Vàng', 2,	7, 150000, 239000, 100,	N'Digital Gold (Vàng số) là cuốn sách lịch sử xuất sắc và vô cùng hấp dẫn về sự ra đời của bitcoin, một tượng đài trong các loại tiền số, một công nghệ tài chính nhưng đã và đang vươn rộng tầm ảnh hưởng tới nhiều lĩnh vực xã hội trên toàn cầu.',
N'(Vàng số) là cuốn sách lịch sử xuất sắc và vô cùng hấp dẫn về sự ra đời của bitcoin...',N'Img/DigitalGold.jpg'),
(13,	N'The Alchemist', 1, 3,	150000,	210000,	5, N'Every few decades a book is published that changes the lives of its readers forever. This is such a book ? a magical fable about learning to listen to your heart, read the omens strewn along life?s path and, above, all follow your dreams.
This is the magical story of Santiago, an Andalusian shepherd boy who dreams of travelling the world in search of a worldly treasure as fabulous as any ever found. From his home in Spain he journeys to the markets of Tangiers, and from there into the Egyptian desert, where a fateful encounter with the alchemist awaits him',
N'Every few decades a book is published that changes the lives of its readers forever. This is such a book ? a magical fable about learning to listen to your heart...',N'Img/TheAlchemist.jpg'),
(14,	N'Tôi Là Bêtô',	4, 1, 45000, 85000,	57,	N'Truyện Tôi là Bêtô là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh được viết theo phong cách hoàn toàn khác so với những tác phẩm trước đây của ông. Những mẩu chuyện, hay những phát hiện của chú chó Bêtô đầy thú vị, vừa hài hước, vừa chiêm nghiệm một cách nhẹ nhàng “vô vàn những điều thú vị mà cuộc sống cố tình giấu kín ở ngóc ngách nào đó trong tâm hồn của mỗi chúng ta”.',
N'Tôi là Bêtô là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh được viết theo phong cách hoàn toàn khác so với những tác phẩm trước đây của ông...',N'Img/ToiLaBeto.jpg'),
(15,	N'Cách Mạng Công Nghệ 4.0',	2, 8, 20000, 36000,	0, N'Cuốn tạp chí kinh tế Cách Mạng Công Nghệ 4.0 đồng hành cùng độc giả để đưa đến cho các bạn những kiến thức cũng như trải nghiệm mới nhất về công nghệ, cùng hướng tới những mục tiêu:
- Nỗ lực trở thành ấn phẩm công nghệ có uy tín và vị thế hàng đầu tại Việt Nam
- Xây dựng một cộng đồng đam mê công nghệ và đầu tư thông minh
- Góp phần nâng cao hiểu biết của cộng đồng và nâng cao vị thế của người Việt trong công nghệ Blockchain nói riêng và công nghệ 4.0 nói chung trên trường quốc tế.',
N'Cuốn tạp chí kinh tế Cách Mạng Công Nghệ 4.0 đồng hành cùng độc giả để đưa đến cho các bạn những kiến thức cũng như trải nghiệm mới nhất về công nghệ...',N'Img/CachMangCongNghe40.jpg'),
(16,	N'Oxford Thương Yêu', 4, 1,	45000, 80000, 23, N'Truyện dài lấy bối cảnh tại trường đại học Oxford – Anh xoay quanh mối tình của cô sinh viên Việt Nam và người trợ giảng Bồ Đào Nha, với một kết thúc có hậu. “Oxford thương yêu” lôi cuốn người dọc bằng những đoạn tả cảnh thiên nhiên tuyệt đẹp, những quan niệm sống cởi mở và hướng thiện của một lớp thanh niên trưởng thành trong giai đoạn đất nước được đổi mới. Ở nhiều đoạn, tác phẩm được khắc họa như một bức tranh lung linh màu sắc và sống động hiện thực.',
N': Truyện dài lấy bối cảnh tại trường đại học Oxford – Anh xoay quanh mối tình của cô sinh viên Việt Nam và người trợ giảng Bồ Đào Nha...',N'Img/Oxford.jpg'),
(17,	N'Ngày Cuối Cùng Của Một Tử Tù', 5,	9, 40000, 75000, 111, N'Tác phẩm ghi lại 24 giờ cuối cùng của cuộc đời một tử tù qua nhật ký của nhân vật xưng tôi - nhân vật không tên tuổi, lai lịch, không nguồn gốc tội lỗi, không ai biết anh ta phạm tội gì đến nỗi trở thành tử tù. Anh ta kể về không gian sinh tồn là nhà tù, những con người va chạm với anh ta trong 24 giờ đó là bạn tù, linh mục, cai ngục... và những người phụ nữ trong tâm tưởng gồm mẹ, vợ và con gái. Tất cả những suy tư đó đan xen với dòng suy nghĩ về việc anh ta sắp bị thi hành án.
Tác phẩm này gần như chứa đừng đầy đủ phong cách, mô típ nhân vật và chủ đề quen thuộc trong sáng tác văn xuôi của Victor Hugo. Đặc biệt hơn nữa, có lẽ đây là tác phẩm chứa đựng nhiều tâm sự thầm kín, những nhức nhối khôn cùng của một nhà văn suốt đời đấu tranh cho quyền “được sống” của con người: án tử hình và sự xóa bỏ vĩnh viễn nó khỏi cuộc sống nhân loại.',N'Tác phẩm ghi lại 24 giờ cuối cùng của cuộc đời một tử tù qua nhật ký của nhân vật xưng tôi - nhân vật không tên tuổi, lai lịch...',N'Img/NgayCuoiCungCuaMotTuTu.jpg'),
(18,	N'Nhà Thờ Đức Bà Paris', 5,	9, 93000, 159000, 3, N'Nhà văn Eugène Sue nhận xét: “… Ngoài chất thơ cùng tất cả sự phong phú của tư tưởng và tính kịch, tôi xin nói thêm cuốn truyện của ông còn có gì đó làm tôi vô cùng xúc động. Có thể nói Quasimodo tiêu biểu cho vẻ đẹp tâm hồn và sự tận tụy, Froll tiêu biểu cho sự uyên bác, trí thức khoa học, khả năng trí tuệ, còn Chateaupers tuyệt diệu để ba nhân vật điển hình đó, cùng một thực chất như chúng ta, đối mặt với một cô gái ngây thơ, gần như man dại giữa nền văn minh, trao cho cô ta quyền được lựa chọn và để cô ta lựa chọn một cách hết sức đàn bà”.',
N'Nhà văn Eugène Sue nhận xét: “… Ngoài chất thơ cùng tất cả sự phong phú của tư tưởng và tính kịch, tôi xin nói thêm cuốn truyện của ông còn có gì đó làm tôi vô cùng xúc động...',N'Img/NhaThoDucBaParis.jpg'),
(19,	N'Combo 6: Để Trẻ Tự Do Suy Nghĩ (Bộ 2 Cuốn)', 6, 10, 94000, 148000, 100, N'Trọn bộ 2 cuốn gồm:
-Tạo lập môi trường sống định hình nhân cách trẻ
-Để trẻ tự do suy nghĩ',N'Trọn bộ 2 cuốn gồm:
-Tạo lập môi trường sống định hình nhân cách trẻ
-Để trẻ tự do suy nghĩ
',N'Img/combo6.jpg'),
(20,	N'Cáo Già, Gái Già Và Tiểu Thuyết Diễm Tình',  4, 1, 20000,	45000, 100,	N'Cáo già, gái già và tiểu thuyết diễm tình, người đọc thường xuyên “đụng đầu” câu hỏi đặt ra cho chính mình: phải chăng, trong thế giới người trẻ, khác biệt văn hoá ngày càng thu hẹp? Người ta đang trở nên giống nhau trong ứng xử, giống nhau khi lựa chọn hướng đi trong cuộc sống, và nhất là sự tương đồng trong các cung bậc xúc cảm? Thấu hiểu và sẵn lòng chia sẽ nên người ta đến với nhau dễ dàng hơn. Tình yêu tâm hồn và cả thể xác không còn là thứ xa vời cấm kỵ. Nhưng chính vì thế, mỗi cá nhân lại bớt phần bí mật, ít đi quyến luyến nên chia tay nhau cũng thấy chóng vánh và nhẹ nhàng hơn.',
N'Cáo già, gái già và tiểu thuyết diễm tình, người đọc thường xuyên “đụng đầu” câu hỏi đặt ra cho chính mình: phải chăng, trong thế giới người trẻ, khác biệt văn hoá ngày càng thu hẹp...',N'Img/CaoGiaGaiGiaVaTieuThuyetDiemTinh.jpg'),
(21,	N'Truyện Ngắn Đặc Sắc Nga',	5, 9, 45000, 86000,	92, N'” (NXB Văn học, 2018) với sự góp mặt ngẫu nhiên của 17 tác giả với 17 tác phẩm. Đáng chú ý nhất là sự xuất hiện của bậc thầy văn chương thế giới - Maxim Goócki bằng truyện ngắn “Băng chuyển”. Ở “Băng chuyển”, thông qua câu chuyện về bảy người thợ mộc sửa chữa cột chắn băng đỡ thân cầu, Maxim Goócki giúp chúng ta lý giải mọi ngõ ngách trong tâm hồn con người. Còn Gian Griva, với “Đại tá Giagata” ông đã xây dựng chân dung con người một cách tài tình, tinh tế và độc đáo ...
Qua “Bến lặng” (Épghênhi Mácximốp), ta sẽ thấy nghị lực phi thường và tính cách quật cường của những người nông dân Nga. Đó là những con người chân chất, thật thà, chịu thương chịu khó, một đời gắn bó với đất đai quê hương đã không khỏi ngỡ ngàng trước sự đổi thay của xã hội và thời cuộc; Nhưng không vì thế mà họ chấp nhận trì trệ, trái lại, họ đã kịp thời chuyển mình để bắt nhịp và sẵn sàng đứng lên khi tổ quốc cần (Bến lặng, Con gái rượu - Vichto Tenpugốp).',
N'Truyện ngắn đặc sắc Nga” (NXB Văn học, 2018) với sự góp mặt ngẫu nhiên của 17 tác giả với 17 tác phẩm...',N'Img/TruyenNganDacSacNga.jpg'),
(22,	N'Chú Cá Trắng Tổ Chức Tiệc Sinh Nhật',	7, 11, 25000, 40000, 42, N'Là món quà dễ đọc, dễ hiểu nhưng cực kì hấp dẫn mà bố mẹ có thể kể con nghe mỗi tối. Giờ kể chuyện buổi tối sẽ đầy hứa hẹn với sắc màu – ngôn ngữ – trò chơi: đuổi bắt, trốn tìm, đoàn tàu tu tu xình xịch, và cả đại dương thăm thẳm có biết bao bè bạn là các sinh vật biển: cô Cua, bạn Ốc Sên này, bác Rùa, chị Cá Voi này 
Bộ truyện tranh nhỏ xinh thôi nhưng sẽ giúp các bé phát triển tư duy ngôn ngữ, nâng cao cảm nhận sắc màu, khả năng ghi nhớ (về sinh vật biển), đặc biệt hơn, các bé được tự nhiên đắm mình trong tình cảm gia đình ấm áp, tình bạn vui tươi tinh nghịch.
Guido van Genechten là một tác giả truyện tranh từng thắng giải Picture Book of The Year (sách tranh của năm) tại Hà Lan. Bộ truyện tranh Chú Cá Trắng của anh nhận được rất nhiều lời khen ngợi từ báo chí và các nhà giáo dục, và nhất là được các em nhỏ yêu thích. Không quá lời khi coi bộ truyện là “món quà trước giấc ngủ”, “những cuốn sách phải có trong giờ kể chuyện”, “những cuốn sách nên được chia sẻ với mọi bé em”.',
N'Là món quà dễ đọc, dễ hiểu nhưng cực kì hấp dẫn mà bố mẹ có thể kể con nghe mỗi tối...',N'Img/ChuCaTrangToChucTiecSinhNhat.jpg'),
(23,	N'Đừng Để Mục Tiêu Như Diều Không Gió',	8, 8, 50000, 89000,	71,	N': Chúng ta thường được khuyên rằng sống phải có mục tiêu. Nhưng đặt ra mục tiêu là một chuyện, lên kế hoạch hành động và đạt được mục tiêu lại là một chuyện khác. 
Có không ít những mục tiêu mãi vẫn nằm nguyên trên giấy vì nhiều lý do: 
- Quá chung chung
- Quá xa rời thực tế
- Không có con số cụ thể cần đạt
- Không phù hợp với bạn
- Không có thời hạn hoàn thành
Nguyên tắc S.M.A.R.T: Specific – Rõ ràng, Measurable – Đo lường được, Attainable – Khả thi, Relevant – Phù hợp, Time-bound – Có thời hạn chính là công cụ để bạn thiết lập chính xác mục tiêu. S. J. Scott sẽ cụ thể nguyên tắc thành 10 bước để bạn biến mục tiêu đúng thành kế hoạch hành động khoa học và thực thi chúng mỗi ngày.',
N': Chúng ta thường được khuyên rằng sống phải có mục tiêu. Nhưng đặt ra mục tiêu là một chuyện, lên kế hoạch hành động...',N'Img/DungDeMucTieuNhuDieuKhongGio.jpg'),
(24,	N'Ngay Bây Giờ Hoặc Không Bao Giờ',	8, 12, 48000, 79000, 3,	N'Ngay bây giờ hoặc không bao giờ sẽ giúp bạn khám phá ra hàng loạt ý tưởng giúp bản thân vượt qua sự trì hoãn hằng ngày. Trong khi nhiều cuốn sách khác chỉ cung cấp những mẹo mực đơn giản, thì với cuốn sách này, bạn sẽ biết được tại sao một chiến lược lại trở nên hiệu quả, nó loại bỏ những hạn chế và niềm tin nào và bằng cách nào chiến lược ấy có thể được ứng dụng tức thì vào cuộc sống của bạn…
Thành công chỉ thực sự đến khi bạn giữ một lòng kiên trì sắt đá với những mục tiêu đã được đặt ra. Trong cuốn sách này, J. S. Scott đã cung cấp chi tiết những kế hoạch hành động trên mọi lĩnh vực của cuộc sống hằng ngày: từ chăm sóc sức khỏe, thể dục, công việc cho tới các mối quan hệ cá nhân. Không giống như các cuốn sách rèn luyện kỹ năng tầm thường khác, nội dung cuốn sách tập trung tối đa vào hai chữ “hành động”. Vì vậy, thay vì phải đọc những lời khuyên chung chung, bạn sẽ nhận được những phương pháp có thể được thực hiện ngay lập tức nhằm tạo lập những thói quen có thể đánh bại sự trì hoãn.',
N'Ngay bây giờ hoặc không bao giờ sẽ giúp bạn khám phá ra hàng loạt ý tưởng giúp bản thân vượt qua sự trì hoãn hằng ngày...',N'Img/NgayBayGioHoacKhongBaoGio.jpg'),
(25,	N'Tôi thấy hoa vàng trên cỏ xanh', 4, 1, 70000,	125000,	15,	N'"Tôi thấy hoa vàng trên cỏ xanh" truyện dài mới nhất của nhà văn vừa nhận giải văn chương ASEAN Nguyễn Nhật Ánh. Cuốn sách viết về tuổi thơ nghèo khó ở một làng quê, bên cạnh đề tài tình yêu quen thuộc, lần đầu tiên Nguyễn Nhật Ánh đưa vào tác phẩm của mình những nhân vật phản diện và đặt ra vấn đề đạo đức như sự vô tâm, cái ác. 81 chương ngắn là 81 câu chuyện nhỏ của những đứa trẻ xảy ra ở một ngôi làng: chuyện về con cóc Cậu trời, chuyện ma, chuyện công chúa và hoàng tử, bên cạnh chuyện đói ăn, cháy nhà, lụt lội,... "Tôi thấy hoa vàng trên cỏ xanh" hứa hẹn đem đến những điều thú vị với cả bạn đọc nhỏ tuổi và người lớn bằng giọng văn trong sáng, hồn nhiên, giản dị của trẻ con cùng nhiều tình tiết thú vị, bất ngờ và cảm động trong suốt hơn 300 trang sách. Cuốn sách, vì thế có sức ám ảnh, thu hút, hấp dẫn không thể bỏ qua.',
N'"Tôi thấy hoa vàng trên cỏ xanh" truyện dài mới nhất của nhà văn vừa nhận giải văn chương ASEAN Nguyễn Nhật Ánh... ',N'Img/Toithayhoavangtrencoxanh.jpg'),
(26,	N'Đắc Nhân Tâm', 8,	13,	42000, 76000, 100, N'Đắc Nhân Tâm, nghĩa là sống sao cho đẹp lòng người, nhằm tạo dựng một cuộc sống an vui trong đời tư, thiện chí và đầy tinh thần hợp tác trong công việc. Lẽ thường sẽ chẳng bao giờ có một chiếc chìa khóa vạn năng mở ra mọi thành công. Bạn phải thông minh, đắc lực, nhiệt huyết và dấn thân. Nhưng Dale Carnegie sẽ nói rằng còn một điều cốt yếu nữa mà ta phải học: kỹ năng thu phục lòng người.
Được xuất bản lần đầu tiên cách nay ngót gần một trăm năm, được dịch ra nhiều ngôn ngữ trên thế giới, với vài chục triệu bản được bán ra, Đắc Nhân Tâm của Dale Carnegie luôn được đón nhận nồng nhiệt ở nhiều quốc gia, đã giúp hàng triệu người gặt hái được thành công trong cuộc sống. Bản thân Warren Buffett, nhà đầu tư huyền thoại người Mỹ, đã đọc Đắc Nhân Tâm ngay từ thuở thiếu niên và tấm bằng duy nhất được treo trong phòng làm việc của Buffett chính là chứng chỉ từ khóa đào tạo của Dale Carnegie. Tất cả như đều minh chứng cho sức hấp dẫn phổ biến và giá trị cốt lõi của Đắc nhân tâm, một hiện tượng xuất bản có sức sống bền lâu hơn những trào lưu thời thượng chóng tàn.
Đọc Đắc Nhân Tâm, nghiền ngẫm những mẩu chuyện thường nhật do chính Dale Carnegie hay các học viên của ông kể lại, hoặc những bài học rút ra từ trong sử sách mà ông dày công sưu tầm, ta chợt nhận ra một điều giản dị rằng nghệ thuật đối nhân xử thế chính là mảnh ghép cuối cùng để làm nên một công thức thành công mỹ mãn, bằng sự bình tâm suy xét, chỉnh đốn bản thân, bằng sức mạnh của lòng chân thành và sự cảm thông.',
N'Đắc Nhân Tâm, nghĩa là sống sao cho đẹp lòng người, nhằm tạo dựng một cuộc sống an vui trong đời tư, thiện chí và đầy tinh thần hợp tác trong công việc...',N'Img/DacNhanTam.jpg'),
(27,	N'Bánh Tuyệt Ngon Không Cần Lò Nướng!',	6, 11,	90000, 135000, 54, N'Chắc hẳn khi nghĩ đến những chiếc bánh ngọt thơm lừng bạn sẽ liên hệ ngay đến sự xuất hiện của lò nướng trong gian bếp. Đã bao giờ bạn nghĩ mình sẽ tự tay làm những chiếc bánh ngon lành kia mà không cần đến lò nướng?
Bạn có cảm giác gì khi nghĩ đến: chiếc pancake vàng ươm với cách làm đơn giản nhanh gọn cho bữa sáng; bánh mousse với lớp kem mát lạnh, mềm mượt như tan trong miệng; vị chua dịu kết hợp với vị béo của kem tươi trong món cheesecake; hay tiramisu mềm mịn, ngọt ngào…
Đâu chỉ có những món bánh hấp dẫn này mà bạn còn có thể làm những loại bánh ngon lành này mà không cần sử dụng lò nướng:
- Brownie hẳn là món bánh dành cho các tín đồ socola. Với nồi cơm điện, những chiếc bánh brownie của bạn sẽ xốp mềm, thơm lừng.
- Mochi đa dạng hương vị: trà xanh, đậu đỏ, dâu tây… cùng lớp vỏ bùi bùi ngọt dẻo khi được quay trong lò vi sóng.
- Pancake vàng ươm, tan chảy hòa cùng vị ngọt của mật ong và mứt hoa quả, chế biến đơn giản chỉ với chiếc chảo chống dính.
..........
Tất cả sẽ được cho ra đời với đôi bàn tay khéo léo của bạn. Và dĩ nhiên… không cần dùng đến lò nướng.
Bánh Tuyệt Ngon, Không Cần Lò Nướng!, thật đơn giản để chế biến những chiếc bánh xinh xắn, ngọt bùi, xốp mềm dành tặng người thương!',
N'Chắc hẳn khi nghĩ đến những chiếc bánh ngọt thơm lừng bạn sẽ liên hệ ngay đến sự xuất hiện của lò nướng trong gian bếp...',N'Img/BanhTuyetNgonKhongCanLoNuong.jpg'),
(28,	N'Sống Đời Hạnh Phúc - Khắc Phục Lo Âu Để Vui Sống', 8,	6, 40000, 66000, 100, N'"Bản thân bạn đã là một điều mới mẻ trên thế gian này rồi. Hãy mừng vì điều đó. Hãy tận dụng tất cả những gì mà tạo hoá đã ban tặng cho bạn. Bởi xét đến cùng, nghệ thuật cũng chỉ là tự thuật mà thôi. Bạn chỉ hát những gì bạn suy nghĩ, chỉ vẽ những gì bạn trông thấy. Bạn chỉ có thể là một con người duy nhất được tạo nên nhờ những yếu tố di truyền riêng. Dù tốt xấu thế nào, bạn cũng phải chịu khó làm lụng trên chính mảnh vườn nhỏ của mình. Dù hay dở thế nào, bạn cũng phải chơi cây đàn bé nhỏ của mình trong bản hoà ca muôn điệu của cuộc đời.
Với mỗi một thế hệ mới, thông điệp của Carnegie lại chỉ ra một khả năng kì lạ có thể tự đánh giá bản thân để phù hợp với sự thay đổi của thế giới. Giao tiếp có hiệu quả, khuyến khích họ đạt được và khám phá được khả năng lãnh đạo tiềm ẩn trong bản thân mỗi người là vấn đề được quan tâm hàng đầu của Dale Carnegie. Với một thế giới đang ở trong tình tạng hỗn loạn như hiện nay thì thời đại của ông lại xuất hiện một lần nữa.Trong những trang tiếp theo, những nguyên tắc của Carnegie về quan hệ của con người được áp dụng cho một loạt những thách thức mà ngày nay con người phải đối mặt.
Đó là những nguyên tắc cơ bản và rất dễ hiểu, không đòi hỏi người học phải có kĩ năng chuyên môn hay có kiến thức chuyên sâu nào. Chỉ cần có tinh thần sẵn sàng học hỏi và luyện tập thật sự là được.
Bạn đã chuẩn bị để đối mặt với những thử thách, những quan điểm lâu đời của thế giới chưa? "',
N'Bản thân bạn đã là một điều mới mẻ trên thế gian này rồi. Hãy mừng vì điều đó...',N'Img/SongDoiHanhPhuc.jpg'),
(29,	N'Giúp Chồng Thành Công', 8, 10, 71000,	11000, 13, N'29.	Giúp Chồng Thành Công của Bà Dale Carnegie do Học giả Nguyễn Hiến Lê dịch. Trong lời Tựa tác giả chia sẻ: “Tôi viết cuốn này cho hạng độc giả trung lưu, có những ước vọng thông thường và có những khả năng như phần đông chúng ta. Những trường hợp đặc biệt thuộc về phạm vi các nhà chuyên môn nên tôi không xét đến. Những qui tắc mà độc giả sẽ đọc có kết quả cụ thể trong chín mươi lăm phần trăm  trường hợp, như vậy cũng là khá rồi. Tôi đã cố trình bày những qui tắc đó một cách rất giản dị và hiệu quả.
(...) Thời này, mỗi ngày càng khó làm giàu, vì càng lên cao trên cái thang xã hội thì thang càng hẹp, mà chỗ đứng càng hiếm. Nhưng tôi có thể quả quyết rằng người đàn bà nào theo qui tắc của tôi một cách thông minh và có ý thức, có thể phá được nhiều vật trở ngại, nó ngăn cản bước tiến của chồng trên đường đời".
Sách được chia làm 10 phần như sau:
Phần 1: Những bước đầu tới thành công.
Phần 2: Những qui tắc căn bản để luyện tư cách của chồng.
Phần 3: Bốn cách để giúp chồng.
Phần 4: Làm sao thích nghi với một tình thế mới.
Phần 5: Muốn chồng thành công nên tránh những cạm này.
Phần 6: Gây hạnh phúc cho chồng.
Phần 7: Làm cho gia đình đầm ấm vui vẻ.
Phần 8: Làm cho chồng được nhiều người mến.
Phần 9: Giữ gìn sức khỏe và tinh thần cho chồng.
Phần 10: Điều quan trọng nhất.',N'Giúp Chồng Thành Công của Bà Dale Carnegie do Học giả Nguyễn Hiến Lê dịch. Trong lời Tựa tác giả chia sẻ: “Tôi viết cuốn này cho hạng độc giả trung lưu...',N'Img/GiupChongThanhCong.jpg'),
(30,	N'Trên Đường Băng',	4, 1, 49000, 80000,	32,	N'Tony Buổi Sáng với cuốn sách đầu tay - Cà Phê Cùng Tony đã bán hơn 60,000 bản cho ra mắt cuốn sách mới mang tên Trên Đường Băng.
Trên Đường Băng tập hợp những bài viết được yêu thích trên facebook của Tony Buổi Sáng nhưng được chọn lọc và tổng hợp có mục đích, chủ đề nhằm mang đến kiến thưc, động lực và năng lượng cho bạn trẻ vào đời.
Cuốn Trên Đường Băng được chia làm 3 phần: “Chuẩn bị hành trang”, “Trong phòng chờ sân bay” và “Lên máy bay”, tương ứng với những quá trình một bạn trẻ phải trải qua trước khi “cất cánh” trên đường băng cuộc đời, bay vào bầu trời cao rộng.
Xuất phát từ cái tâm trong sáng của người đi trước dày dặn kinh nghiệm, kiến thức, Tony Buổi Sáng mang đến đọc giả những bài viết hài ước, tinh tế, sinh động và đầy thiết thực. Cuốn Trên Đường Băng với những bài viết về thái độ với sự học và kiến thức nói chung, cách ứng phó với những trắc trở thử thách khi đi làm, cách sống hào sảng nghĩa tình văn minh… truyền cảm hứng cho các bạn trẻ sống hết mình, trọn vẹn từng phút giây và sẵn sàng cho hành trang cuộc sống.
Trên Đường Băng của Tony Buổi Sáng tuy hướng đến những đọc giả là những người trẻ nhưng những người lớn hơn vẫn để hiểu hơn, và có cách nhìn nhận cũng như giáo dục con em mình tốt nhất thay vì bảo vệ con quá kĩ trở nên yếu ớt và thiếu tự lập. Và để yêu thương “khoa học” nhất. Đây cũng là cuốn sách mà những người đi làm nên sở hữu để nhìn lại chặng đường mình đã đi qua, suy ngẫm và thay đổi vì chưa bao giờ là quá muộn.
Một cuốn sách với nhiều điều để bạn học hỏi, suy ngẫm và chuẩn bị tốt nhất cho hành trang trên con đường tuổi trẻ của chính mình. ',
N'Tony Buổi Sáng với cuốn sách đầu tay - Cà Phê Cùng Tony đã bán hơn 60,000 bản cho ra mắt cuốn sách mới mang tên Trên Đường Băng...',N'Img/TrenDuongBang.jpg'),
(31,	N'Cà Phê Cùng Tony', 4,	1, 50000, 90000, 112, N'Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ như nên chú ý những phép tắc xã giao thông thường.
Chúng tôi tin rằng những người trẻ tuổi luôn mang trong mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động viên họ biến điều đó thành hành động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp, như tách cà phê thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng.
Tony Buổi Sáng cũng là tác giả của Trên đường băng, tác phẩm hiện đã bán hơn 200.000 bản.',N'Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng...',N'Img/CaPheCungTony.jpg'),
(32,	N'Bốn Mươi Gương Thành Công', 8, 10, 83000,	125000,	2, N'Đọc câu chuyện của những người thành công và học cách “soi gương” có hiệu quả cùng những câu chuyện đó
Dale Carnegie là tác giả nổi tiếng của những cuốn sách bán chạy nhất mọi thời đại như Đắc Nhân Tâm, Quẳng gánh lo đi và vui sống,... Bạn chưa phải thuộc hạng tỷ phú, bạn luôn bận rộn với công việc, nhưng nếu bạn ham đọc sách, thành công sẽ đến với bạn nhanh chóng. Nếu bạn cần một nhà chuyên môn để giới thiệu những cuộc đời thành công nhất để bạn học hỏi, Dale Carnegie luôn sẵn sàng giúp bạn việc đó.
Câu chuyện của những con người thành công luôn truyền cảm hứng mạnh mẽ cho những người đang cố gắng để đạt được những thành tựu trong cuộc đời mình. Họ là ai? Câu chuyện của họ là gì? Độc giả sẽ học được gì qua những tấm gương đó? Tất cả đã được tác giả Dale Carnegie gói gọn vào trong cuốn sách “40 Gương thành công”.',
N'Đọc câu chuyện của những người thành công và học cách “soi gương” có hiệu quả cùng những câu chuyện đó...',N'Img/BonMuoiGuongThanhCong.jpg'),
(33,	N'Bán Hàng Bằng Trí Tuệ Xúc Cảm', 3, 1,	80000, 138000, 51, N'Chuyên gia tăng tốc bán hàng Jeb Blount, người được Forbes bình chọn là một trong 30 người ảnh hưởng đến bán hàng đại chúng nhất, cung cấp một cuộc thảo luận gần gũi và thẳng thắn về các chi tiết của cách tiếp cận đã được chứng minh rộng rãi của ông trong việc làm chủ và chốt các thương vụ phức tạp. Ông minh họa các chủ đề bằng những câu chuyện cá nhân về việc áp dụng những kỹ thuật trong việc bán hàng của mình, kèm nguyên văn những cuộc đối thoại để chuẩn bị tinh thần cho bạn về những gì có thể gặp phải trong nghề. Bạn sẽ chẳng phải mua thêm bất cứ thứ gì khác nữa với chương trình huấn luyện hoàn chỉnh này. Sau cùng, bạn sẽ có thể:
• Đánh giá, thấu hiểu, và nâng cao trí tuệ xúc cảm bán hàng của mình
• Giành được quyền kiểm soát trong đàm phán bán hàng bằng cách lật ngược kịch bản của người mua
• Lôi kéo khách mua hàng vào không gian của bạn, điều khiển sự chú ý của họ, và giữ cho họ tham gia bằng cách làm nhiễu các kỳ vọng của họ.
• Quét sạch sự kháng cự, xung đột và phản đối của khách mua hàng thông qua các khuôn khổ gây ảnh hưởng đã được chứng minh qua thực tiễn.
• Chốt các cam kết vi mô và những thỏa thuận cho các bước đi kế tiếp nhằm ngăn các thương vụ của bạn bị trì hoãn và tăng tốc quy trình bán hàng.
Trong cuốn sách này, bạn có được chìa khóa để mở tung các bí mật nhằm kéo khách mua hàng cảm tính ra khỏi vùng thoải mái của họ và không cho họ lựa chọn nào khác ngoài việc đồng ý.',
N'Chuyên gia tăng tốc bán hàng Jeb Blount, người được Forbes bình chọn là một trong 30 người ảnh hưởng đến bán hàng đại chúng nhất...',N'Img/BanHangBangTriTueXucCam.jpg'),
(34,	N'Hôm Nay Tôi Thất Tình', 4, 14, 50000,	86000, 2, N'Muốn vượt qua nỗi đau thất tình ư, dễ lắm Đôi khi vẫn nghĩ, sao cứ phải ôm mãi một bó củi khô khi phía trước là rừng rậm, phải tiếc một gáo nước đã đổ đi khi suối nguồn đang ở phía trước?
Thất tình, một điều có thể làm bất kì ai sợ hãi. Tình yêu bỏ rơi, buồn thật đấy!
Duyên số đôi khi cũng buồn cười lắm, cho người ta gặp nhau rồi cuối cùng cũng chẳng thể cùng bước đến tận cuối con đường. Hai người hai hướng, chỉ còn con tim đang ngẩn ngơ vì tình.
Là do người đánh mất hay vì người chưa từng có. Người tự yêu, tự an ủi trong mối tình vốn đã sớm nhận ra chẳng thể thành đôi. Người làm bộ như không sao cả, thời gian tự trôi rồi mọi thứ sẽ ổn. Nhưng hai chữ thất tình vẫn như giọt buồn tràn ly, ghim chặt thành sự ám ảnh
Người mượn tình cảm để chôn vùi tình cũ, mượn một tấm thân xa lạ để xoa dịu cơn đau, nuôi mộng bóng hình xưa sẽ tàn phai theo năm tháng. Rồi người nhận ra mình vừa vô trách nhiệm với mình,  lại đang gieo cả sự bất hạnh cho kẻ khác.
Thất tình là thế đó, đủ câu chuyện với nhiều nỗi niềm mông lung. Nhẹ nhàng với những áng văn chương truyền cảm, Hôm nay tôi thất tình cùng Hạ Vũ nói hộ tấm chân tình da diết của biết bao kẻ đang cô đơn. Viết cho những ngày người uống thật say để không còn thương nữa. Người chỉ muốn ôm mặt mà bật khóc để vơi đi cái nhói đau đang quặn thắt trong lòng. Ngày qua ngày trôi đều như thế, kẻ đi rồi có biết được đâu.
Hôm nay tôi thất tình, là cuốn nhật kí ghi lại những dấu ấn của tình yêu tuổi trẻ. Nơi cất lại những bức họa buồn được người tô vẽ trong vội vàng. Người muốn vượt qua nỗi buồn hãy cứ bình tĩnh, Xa người đó rồi, nhất định sẽ gặp được một kẻ tốt hơn. Ông trời sắp đặt cả rồi, không cần gấp. Người hãy như Hạ Vũ, cứ im lặng, đi xem phim, đi shopping, đi ăn, đi chơi với bạn bè, chăm chỉ lên lớp, chăm chỉ đi làm... Từng bị tổn thương một lần rồi, đừng dùng những hành vi ngây thơ trẻ con làm tổn thương chính mình để trả thù hay trút hết cảm xúc. Có thù hận nặng nề tới mấy kẻ đã bỏ buông cũng chẳng quay lại.
Đó vượt qua thất tình không khó phải không? Hôm nay tôi thất tình, thở dài một cái, thả cảm xúc vào khoảng không, nhìn đời nhất có thể và người có thể thanh thản, dũng cảm đi tiếp đươc rồi.',
N'Muốn vượt qua nỗi đau thất tình ư, dễ lắm...
Đôi khi vẫn nghĩ, sao cứ phải ôm mãi một bó củi khô khi phía trước là rừng rậm, phải tiếc một gáo nước đã đổ đi khi suối nguồn đang ở phía trước?
',N'Img/HomNayToiThatTinh.jpg'),
(35,	N'Tuổi Trẻ Đáng Giá Bao Nhiêu?', 8,	15,	51000, 71000, 0, N'“Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.
Bạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng.
Bạn có chết mòn nơi xó tường với những ước mơ dang dở, đó không phải là việc của họ.
Suy cho cùng, quyết định là ở bạn. Muốn có điều gì hay không là tùy bạn.
Nên hãy làm những điều bạn thích. Hãy đi theo tiếng nói trái tim. Hãy sống theo cách bạn cho là mình nên sống.
Vì sau tất cả, chẳng ai quan tâm.”
“Tôi đã đọc quyển sách này một cách thích thú. Có nhiều kiến thức và kinh nghiệm hữu ích, những điều mới mẻ ngay cả với người gần trung niên như tôi.
Tuổi trẻ đáng giá bao nhiêu? được tác giả chia làm 3 phần: HỌC, LÀM, ĐI.
Nhưng tôi thấy cuốn sách còn thể hiện một phần thứ tư nữa, đó là ĐỌC.
Hãy đọc sách, nếu bạn đọc sách một cách bền bỉ, sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình.
Nếu tôi còn ở tuổi đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần.”',N'Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.
Bạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng...
',N'Img/TuoiTreDangGiaBaoNhieu.jpg'),
(36,	N'Steve Jobs - Sống Để Thay Đổi Thế Giới', 3, 10, 30000, 50000, 2, N'Các khách hàng ngày ngày sử dụng sản phẩm của Apple sẽ còn ấn tượng về Steve Jobs với biểu tượng quả táo khuyết. Nhiều ý kiến cho rằng Steve Jobs với phong cách lãnh đạo cách tân thể hiện ở Apple và ở Pixar đã trở thành những câu chuyện tiêu biểu tinh thần doanh nhân mạo hiểm, có ảnh hưởng không nhỏ đến giới công nghệ và giải trí.
Cuốn sách Steve Jobs - Sống để thay đổi thế giới của tác giả Hạ Vũ, sẽ mang đến cho bạn những trải nghiệm mới mẻ, bài học quý báu qua hành trình cuộc đời, sự nghiệp của Steve Jobs.
Cuốn sách khắc hoạ rõ ràng về cuộc đời, những thành công cũng như thất bại của Steve Jobs, qua đó bạn sẽ rút ra được những bài học, những châm ngôn sống.
Steve Jobs đã từng quan niệm: Sống là để thay đổi thế giới. Lúc sinh thời, ông luôn “cháy” hết mình cho công việc. Phương châm “sống là không chờ đợi” được thể hiện rõ qua những phát biểu của ông về tất cả các lĩnh vực liên quan đến công việc, sự sáng tạo hay cái chết.',
N'Các khách hàng ngày ngày sử dụng sản phẩm của Apple sẽ còn ấn tượng về Steve Jobs với biểu tượng quả táo khuyết...',N'Img/SteveJobs.jpg'),
(37,	N'Thám Tử Lừng Danh Conan - Tập 90', 7,	16,	10000, 18000, 0, N'Sự thật nào sẽ được làm sáng tỏ đằng sau mối bất hòa giữa hai con người phục vụ công lí ở hai vị thế khác nhau - mật vụ FBI Akai và cảnh sát Amuro!?
Cuộc phiêu lưu mới sẽ đưa độc giả đến gần hơn với Tổ chức Áo Đen, tiết lộ mối quan hệ giữa Sera và “em gái ngoài lãnh địa”!!
Cuối cùng, chuyện tình cảm giữa Heiji và Kazuha cũng có nhiều chuyển biến…!!',N'Sự thật nào sẽ được làm sáng tỏ đằng sau mối bất hòa giữa hai con người phục vụ công lí ở hai vị thế khác nhau ..',N'Img/Conan.jpg'),
(38,	N'Mình Nói Gì Khi Nói Về Hạnh Phúc?', 8, 15, 38000, 60000, 4, N'“Hạnh phúc khi thấy mình được sinh ra. Được trải qua tất cả những vui buồn sướng khổ. Được tư duy và chiêm nghiệm. Ngẫm ra, được làm người đã là hạnh phúc lắm rồi, có cần điều gì khác nữa đâu."
Hành trình của quyển sách này là hành trình đi tìm hạnh phúc khác với khuôn mẫu xã hội, là cuộc tìm kiếm từ bên ngoài vào bên trong, từ chốn đông người tới chỗ không người, tìm từ người khác đến tìm trong chính mình. Đó là một hành trình dài, nơi bạn có thể thấy những thay đổi trong quan niệm và suy nghĩ của người viết, từ một người trẻ nông nổi và nhiệt thành, đến một người đã trưởng thành hơn, trầm lắng hơn, nhẹ nhàng hơn, nhưng vẫn luôn tràn đầy tình yêu cuộc sống. Bạn sẽ bắt gặp ở đây những niềm vui giản dị, những điều đẹp đẽ trên muôn dặm đường dài, những suy tư về tình yêu, về các chuyến lữ hành, về những ngày đang sống. Hơn thế nữa, đây là cuộc hành trình của những chiêm nghiệm suy tư về hạnh phúc, về mục đích cuộc sống, về thân phận con người.
Mình nói gì khi nói về hạnh phúc? là những tâm sự và trải lòng trên hành trình sống và đi, những suy tư về hạnh phúc, về mục đích sống, và thân phận con người. Giọng kể chuyện cứ như thủ thỉ tâm tình, đem lại cảm giác dễ chịu, nhẹ nhàng mà sâu lắng. Và trong những câu chữ đều lấp lánh vẻ đẹp của tình yêu cuộc sống.
Tác phẩm gồm ba phần chính là Sống, Yêu, Vui với gần 30 bài viết dưới phong cách tự sự nhằm hướng tới những bạn trẻ để các bạn chiêm nghiệm về cuộc sống và hạnh phúc. Ngôn ngữ giản dị gần gũi như chính tâm sự của tác giả với bạn đọc',
N'Hạnh phúc khi thấy mình được sinh ra. Được trải qua tất cả những vui buồn sướng khổ. Được tư duy và chiêm nghiệm. Ngẫm ra, được làm người đã là hạnh phúc lắm rồi, có cần điều gì khác nữa đâu...',N'Img/MinhNoiGiKhiNoiVeHanhPhuc.jpg'),
(39,	N'Yêu Sao Để Không Đau', 4, 14,	48000, 86000, 1, N'"Quyển sách, sẽ như những lời “hướng dẫn giữ gìn” tình yêu cho bạn, là những gì tôi đã đi trước, trải nghiệm và ghi nhận. Bạn có thể lấy nó làm hành trang vững chắc trên con đường tình yêu của mình, cũng có thể đọc để cho biết thôi, và vẫn yêu theo cách riêng mà mình muốn. Nhưng, có thể hứa với tôi một điều này không? Rằng dù bạn có chọn thế nào, thì cũng nhất định không được hối tiếc với sự chọn lựa đó của mình. Vì vốn dĩ bạn đã từng biết, từng hiểu được, nhưng vẫn cam lòng đi theo tiếng gọi của con tim, không hề lo ngại. Sự dấn thân đó là một điều đáng hãnh diện. Sự lựa chọn đó sẽ là một dấu son đỏ cho một thời trẻ dại nhưng vô cùng lộng lẫy của bạn. Một thời từng thương, từng nhớ, từng mơ mộng, từng hi vọng… Một thời thật đẹp! Thế nên, hứa với tôi, đừng bao giờ hối tiếc cả. Cũng như đừng bao giờ để sự hối tiếc cản trở con đường đi tìm kiếm hạnh phúc của cuộc đời mình, được không?"'
,N'Quyển sách, sẽ như những lời “hướng dẫn giữ gìn” tình yêu cho bạn, là những gì tôi đã đi trước, trải nghiệm và ghi nhận...',N'Img/YeuSaoDeKhongDau.jpg'),
(40,	N'Thám Tử Lừng Danh Conan - Tập 91', 7,	16,	10000, 18000, 0, N'Conan và Heiji vạch mặt Nue... Kid chạm trán Okiya!!
Thiếu nữ Kyoto xinh đẹp đang theo đuổi Heiji, và cô giáo hậu đậu đầy góc khuất... những phụ nữ bí ẩn sẽ thay phiên nhau xuất hiện ở tập này...!?'
,N'Conan và Heiji vạch mặt Nue... Kid chạm trán Okiya!!
Thiếu nữ Kyoto xinh đẹp đang theo đuổi Heiji...',N'Img/conan1.jpg'),
(41,	N'Anh Chính Là Thanh Xuân Của Em', 4, 11, 48000, 89000,	7, N'“Quãng thời gian tươi đẹp đó, anh biết tại sao nó được gọi là thanh xuân không?
Bởi vì khi đó, anh đã xuất hiện trong cuộc đời em.”
Thanh xuân, hai chữ giản dị nhất, nhưng cũng chứa đựng nhiều điều khó nói nhất của một đời người. Không có khoảng thời gian nào mà người ta lại khao khát quay trở lại như thời điểm ấy. Khoảng thời gian mà dẫu có buồn nhiều hơn vui, đau lòng nhiều hơn hạnh phúc, tiếc nuối nhiều hơn hài lòng, người ta vẫn muốn quay trở lại, chỉ để được sống trong cảm giác tươi đẹp, gặp được người mình thương năm ấy một lần nữa…',
N'“Quãng thời gian tươi đẹp đó, anh biết tại sao nó được gọi là thanh xuân không?
Bởi vì khi đó, anh đã xuất hiện trong cuộc đời em.”
',N'Img/AnhChinhhLaThanhXuanCuaEm.jpg'),
(42,	N'Thám Tử Lừng Danh Conan - Tập 92', 7, 16,	10000, 18000, 0, N'Kí ức của Conan dội về cùng tiếng sóng vỗ bờ... Đó là cảnh bãi biển nơi Shinichi & Ran tình cờ gặp Sera ngày bé... Đó còn là hình ảnh không thể nhầm lẫn của chàng trai trẻ Shuichi AKAI...!?
Thám tử Conan đã quay trở lại với những vụ án mới và được mong chờ nhất…!!',N'Kí ức của Conan dội về cùng tiếng sóng vỗ bờ... Đó là cảnh bãi biển nơi Shinichi & Ran tình cờ gặp Sera ngày bé... ',N'Img/conan2.jpg'),
(43,	N'Ta Ba Lô Trên Đất Á',	4, 15, 62000, 108000, 2, N'Cuốn sách đầu tiên của người Việt hướng dẫn chi tiết về việc đi du lịch.
“Hầu hết mọi người đều thích du lịch, và hầu hết người trẻ đều thích du lịch bụi. Nhưng làm thế nào để có thể đi? Nếu bạn đang tự hỏi câu đó, thì tôi có tin mừng cho bạn: du lịch bụi không phải là chế tạo tên lửa. Nó dễ thôi, và không tốn nhiều tiền như ta tưởng.”
Rosie Nguyễn đã mở đầu cuốn sách nhỏ này một cách thẳng thắn, mộc mạc và hài hước như thế. Đó cũng là cách mà cô “dẫn dắt” người đọc trong suốt hành trình Ta ba lô trên đất Á - cuốn sách đầu tiên của một tác giả Việt hướng dẫn chi tiết về việc đi du lịch.
Một vài năm trở lại đây, sách viết về đề tài du lịch ngày càng nhận được nhiều sự quan tâm của độc giả trẻ. Tuy nhiên, có nhiều ý kiến cho rằng: sách du ký truyền cho người trẻ cảm hứng sống và xê dịch, nhưng không trực tiếp đến mức khuyến khích hay trở thành động lực để độc giả đọc xong là có thể “xách ba lô và lên đường”. Lý do là bởi những cuốn sách du ký thường tập trung vào việc kể lại những trải nghiệm, suy nghĩ của tác giả nhưng lại thiếu đi rất nhiều thông tin cần thiết, cụ thể để độc giả có thể tự thực hiện được một hành trình của riêng mình.
Nhưng rõ ràng, “du lịch bụi” không nên chỉ là một cụm từ hay một ý niệm để người trẻ đôi khi mơ màng nghĩ tới rồi chậc lưỡi. Du lịch bụi nên là một kế hoạch cụ thể. Và Ta ba lô trên đất Á ra đời để giúp bạn hiện thực kế hoạch đó.
Cuốn sách được chia làm nhiều chương. Chương đầu tiên dẫn người đọc đến với thế giới phượt: thế nào là phượt, phượt thì cần những gì, phượt để làm gì? Chương thứ hai là những hướng dẫn quan trọng và thực tế để phượt, từ việc tìm thông tin ở đâu, nên lựa chọn điểm đến và hành trình như thế nào, cho đến những điều nên chú ý khi đi phượt, thậm chí còn bao gồm cả một danh sách mẫu những đồ dùng cần mang theo khi phượt. Các chương tiếp theo đầy ắp kiến thức về văn hóa, lịch sử, địa lý, con người ở các quốc gia, những kinh nghiệm du lịch cụ thể, những câu chuyện, trải nghiệm thú vị, chân thực và đầy cảm xúc trên từng cung đường tác giả đã đi qua. Tất cả được viết với một văn phong giản dị, gần gũi nhưng không kém phần sâu sắc và dí dỏm. '
,N': Cuốn sách đầu tiên của người Việt hướng dẫn chi tiết về việc đi du lịch.
“Hầu hết mọi người đều thích du lịch, và hầu hết người trẻ đều thích du lịch bụi. Nhưng làm thế nào để có thể đi? Nếu bạn đang tự hỏi câu đó, thì tôi có tin mừng cho bạn: du lịch bụi không phải là chế tạo tên lửa. Nó dễ thôi, và không tốn nhiều tiền như ta tưởng.”
...',N'Img/TaBaLoTrenDatA.jpg'),
(44,	N'Thám Tử Lừng Danh Conan - Tập 93', 7,	16,	10000, 18000, 0, N'Conan và Heiji tình cờ gặp án mạng ở tiệm cà phê Poirot!! 
Họ cùng Arumo bắt tay vào điều tra vụ án, nhưng chuyện gì sẽ xảy ra...!? 
Trong khi đó, nhân vật gợi liên tưởng đến RUM - thân cận của "người đó" đã xuất hiện trước mặt nhóm thám tử nhí...!?',N'Conan và Heiji tình cờ gặp án mạng ở tiệm cà phê Poirot!! ',N'Img/conan3.jpg'),
(45,	N'Làn Sóng Thứ Ba',	3, 1, 50000, 108000, 40, N'Làn sóng Thứ ba là kỷ nguyên mà Internet sẽ không còn thuộc về các công ty Internet nữa. Đó là kỷ nguyên mà trong đó các sản phẩm sẽ yêu cầu sự có mặt của mạng Internet, kể cả khi Internet không nằm trong định nghĩa của những sản phẩm đó. Đó là kỷ nguyên mà thuật ngữ “Internet hóa” sẽ trở nên bình thường như thuật ngữ “điện khí hóa” trước đây, như thể chẳng có sự khác biệt nổi bật nào giữa hai thuật ngữ trên. Đó là kỷ nguyên của Internet kết nối vạn vật (Internet of Things – IoT).
Steve Case – đồng sáng lập của AOL – trình bày một “lộ trình thuyết phục dành cho tương lai… giúp chúng ta có thể hiểu được những thay đổi về công nghệ đang định hình nền kinh tế của chúng ta và thế giới của chúng ta như thế nào”.
Trong quyển sách này, Case dùng hiểu biết sâu sắc của mình tích lũy được qua hàng thập kỷ làm việc như một nhà đổi mới, nhà đầu tư, doanh nhân để nêu bật tầm quan trọng của khởi nghiệp và vạch ra lộ trình cho những nhà đổi mới tương lai.
Vừa như một hồi ký, vừa như một tuyên bố, vừa như một hướng dẫn về tương lai, quyển sách này giải thích nguyên do các công ty công nghệ mới nổi sẽ phải tư duy lại mối quan hệ của họ với khách hàng, với đối thủ, và với chính quyền; và đưa ra lời khuyên để các doanh nhân có thể ra những quyết định và chiến lược kinh doanh thành công – và chỉ cách để tất cả chúng ta có thể hiểu được kỷ nguyên số không ngừng thay đổi này.'
,N'Làn sóng Thứ ba là kỷ nguyên mà Internet sẽ không còn thuộc về các công ty Internet nữa. Đó là kỷ nguyên mà trong đó các sản phẩm sẽ yêu cầu sự có mặt của mạng Internet...',N'Img/LanSongThuBa.jpg'),
(46,	N'Sherlock Holmes Toàn Tập', 5,	9, 300000, 500000, 0, N'Bạn đọc yêu thích truyện trinh thám thế giới có lẽ không ai là không biết đến tên tuổi của nhà văn Anh Arthur Conan Doyle (1859-1930), cha đẻ của nhân vật thám tử lừng lẫy Sherlock Holmes. Tuy nhiên, không phải ai cũng biết rằng: xung quanh việc ra đời những tác phẩm liên quan đến nhà thám tử tài ba này, bản thân tác giả của nó đã từng có những hành động hết sức ly kỳ, hấp dẫn, không kém những gì mà thám tử Holmes từng phô diễn. 
Sherlock Holmes là một thám tử tư ở Luân Đôn nổi tiếng nhờ trí thông minh, khả năng suy diễn logic và quan sát tinh tường trong khi phá những vụ án mà cảnh sát phải bó tay.
Sherlock Holmes đã xuất hiện trong 4 tiểu thuyết và 56 truyện ngắn của nhà văn Conan Doyle. Hầu như tất cả các tác phẩm đều được viết dưới dạng ghi chép của bác sĩ John H.Watson, người bạn thân thiết và người ghi chép tiểu sử của Holmes, chỉ có 2 tác phẩm được viết dưới dạng ghi chép của Holmes và 2 tác phẩm khác dưới dạng ghi chép của người thứ ba....
Nhiều người cho rằng Sherlock Homes là nhân vật thám tử hư cấu nổi tiếng nhất trong lịch sử văn học và là một trong những nhân vật văn học được biết đến nhiều nhất trên toàn thế giới.
Đến với bộ sách Sherlock Holmes toàn tập, quý độc giả sẽ hiểu vì sao tác phẩm này lại được bạn đọc khắp thế giới yêu thích đến như thế. ',
N'Bạn đọc yêu thích truyện trinh thám thế giới có lẽ không ai là không biết đến tên tuổi của nhà văn Anh Arthur Conan Doyle (1859-1930), cha đẻ của nhân vật thám tử lừng lẫy Sherlock Holmes...',N'Img/SherlockHolmes.jpg'),
(47,	N'Gửi Thời Đơn Thuần Đẹp Đẽ Của Chúng Ta (Bộ 2 Tập)', 5, 11, 138000, 199999, 19, N'GỬI THỜI ĐƠN THUẦN ĐẸP ĐẼ CỦA CHÚNG TA – Cho những người dùng cả thanh xuân để THÍCH một người. 
 “Năm tháng đó tôi đã hết lòng vì cậu, nên dù cậu có thích tôi hay không, thì tôi cũng không hối tiếc nữa.”
Người ta thường bảo thanh xuân của chúng ta phần lớn là dành để chờ đợi một người không bao giờ đến. Những ngày ấy, chúng ta cứ ngây dại thích một người mà không toan tính, thậm chí cũng chẳng cần được hồi đáp.
Giống như cô gái nhỏ Tiểu Hy trong "Gửi thời đơn thuần đẹp đẽ của chúng ta" đã từng nói: "Tôi không hiểu vì sao mình lại thích cậu ấy nhiều như vậy. Nhưng tôi luôn tin cậu ấy chính là định mệnh của đời mình. Giang Thần - Thanh mai trúc mã của tôi, người duy nhất tôi thích suốt cả cuộc đời."
Năm tháng đó, chúng ta đều thích một người mà không hiểu lý do. Chúng ta cháy hết mình cho tình yêu, cho những ước vọng, nhiều khi là cho cả những thứ mơ hồ và xa xăm nhất.
Nhưng cũng chính nhờ những khờ dại, ngô nghê đó, mà thanh xuân bỗng nhiên trở thành khoảng thời gian khiến lòng ta chùng lại, tim ta bồi hồi khi nhớ về.
Thanh xuân tuyệt vời nhất chính là có thể vì ai đó mà muốn đến trường hơn, vì ai đó mà gắng sức vùi đầu vào sách vở, vì ai đó mà thoáng chốc đỏ mặt ngượng ngùng, lại cũng vì ai đó mà đôi khi hờn giận vô cớ.
Thanh xuân tuyệt vời nhất có khi chỉ là những giây phút được cùng cậu ấy đạp xe đi học, được trộm ngắm cậu ấy tập trung làm bài, được cậu ấy xách cặp hộ và đỡ lên khi vấp ngã. Hay đơn giản hơn là cái vỗ trán khi trót nói những điều ngốc nghếch cũng đủ khiến trái tim xốn xang cả ngày.
Nhưng... 
Thanh xuân ấy đơn thuần mà đẹp đẽ, 
Thanh xuân ấy đầy thương mến cũng đầy nuối tiếc. 
Chúng ta đều sẽ lớn lên, ai rồi cũng sẽ phải trải qua những cảm giác bồi hồi, xúc động và tiếc nuối như thế để bước vào đời. Những ngã rẽ kéo chúng ta về những lối đi khác nhau. Càng ngày càng xa. 
“Gửi thời đơn thuần đẹp đẽ của chúng ta” cuốn sách dành tặng tuổi trẻ của bạn. Tặng cho những cảm xúc chớm nở, những bối rối, những chấp chênh của mối tình đầu. Tặng cho những ai đang đứng giữa ngã ba đường của thương thương nhớ nhớ, của những điểm chạm trái tim. 
Cùng với Giang Thần và Tiểu Hi sống những ngày thanh xuân đơn thuần mà lấp lánh như thế nhé! 
',N'GỬI THỜI ĐƠN THUẦN ĐẸP ĐẼ CỦA CHÚNG TA – Cho những người dùng cả thanh xuân để THÍCH một người. 
 “Năm tháng đó tôi đã hết lòng vì cậu, nên dù cậu có thích tôi hay không, thì tôi cũng không hối tiếc nữa.”...
',N'Img/GuiThoiDonThuanDepDeCuaChungTa.jpg'),
(48,	N'Đi Qua Hoa Cúc',	4,	1,	40000,	70000,	65,	N'Cuốn Đi Qua Hoa Cúc là tập truyện dài của Nguyễn Nhật Ánh, mở đầu câu truyện tác giả kể lại tuổi ấu thơ hồn nhiên của nhân vật trong truyện, kết hợp với tả cảnh ở miền quê, những ngôi nhà nằm dọc hai bên đường đá sỏi dọc theo hai bên hàng dâm bụt và cả cây sứ cây bàng tỏa bóng mát, tỏa hương thơm trước sân nhà. Một nét vẽ nên thơ thật đầm ấm ở một vùng quê xa xôi tác giả dường như làm ấm lòng cho người đọc. Thật vậy mỗi cốt truyện của Nguyễn Nhật Ánh đã phác họa lên một nét quê hương ngọt ngào, một thời ấu thơ đẹp, một tình yêu của tuổi học trò cũng hòa lẫn tình yêu khát khao của bao lứa tuổi. Cuốn truyện dài Đi Qua Hoa Cúc là một trong những tác phẩm tuyệt tác hay của tác giả làm thôi thúc người đọc thêm nhiều ấn tượng và sự lôi cuốn tràn dâng trong lòng bạn đọc.
"Trước nhà bà nội tôi có một cây bàng cao thật cao. Mỗi lần về thăm nội, khi chiếc xe gobel của ba tôi ngoặt quanh cái giếng đá đầu làng, bao giờ tôi cũng nhấp nhổm ở yên sau và hồi hộp ngước mắt trông lên. So với dãy hàng rào dâm bụt của những ngôi nhà nằm dọc hai bên con đường đá sỏi, kể cả ngọn sầu đông và cây sứ trắng toả hương thơm nức mũi trước sân nhà bà tôi lúc nào cũng vươn cao sừng sững. Khi nhìn lên, hễ thấy tán bàng xanh um kia hiện ra trong tầm mắt như một chấm đen mỗi lúc một lớn dần, tôi biết ngay đã sắp đến nhà bà. Và thế là tôi không nén nổi nụ cười sung sướng. Và cả e thẹn nữa, chẳng hiểu vì sao. Những lúc đó, bao giờ tôi cũng úp mặt vào lưng ba tôi để giấu đi nỗi xao xuyến của mình. Cũng như vậy, trước ngõ nhà ông ngoại tôi là một hàng rào hoa giấy đỏ. Hoa không thẫm, chỉ đỏ hồng. Vì trồng lâu năm nên cây uốn lượn chằng chịt, gốc nào gốc nấy to bằng bắp chân người. Hoa rực rỡ từng chùm, từng nhánh, phủ kín cả hai trụ cổng bằng đá ong lâu ngày lên rêu xanh mướt. Quê nội tôi thuộc một làng miền núi. Quê ngoại tôi ở miệt đồng bằng. Nhà ông tôi ở cách đường quốc lộ non một cây số về phía biển. Nhưng vì không bị cây cối che khuất nên đứng trên đường người ta vẫn có thể trông thấy rõ mồn một vừng hoa đỏ ối dưới kia. Sau này, khi đã đi xa, mỗi lần về thăm ngoại, tôi ngồi trên xe đò băng qua cầu Cẩm Lễ, mắt nôn nao ngóng về phía biển, hễ thấy hoa đỏ vẫy tay là biết đã tới nhà."',
N'Cuốn Đi Qua Hoa Cúc là tập truyện dài của Nguyễn Nhật Ánh, mở đầu câu truyện tác giả kể lại tuổi ấu thơ hồn nhiên của nhân vật trong truyện, kết hợp với tả cảnh ở miền quê...',N'Img/DiQuaHoaCuc.jpg'),
(49,	N'Gửi Thanh Xuân Ấm Áp Của Chúng Ta (Bộ 2 Tập)', 5,	8, 127000, 199999, 18, N': Gửi cho thời thanh xuân ấm áp nhất của chúng ta.
Bạn đã bao giờ tự hỏi lòng mình, “thanh xuân” là gì hay chưa? 
Thanh xuân, là những thước phim quay chậm về những tháng ngày non nớt; những tháng ngày gục đầu trên bàn học của giảng đường. Là những cô bạn thân cùng bàn năm đó, hay chị chị em em chung một kí túc nho nhỏ, hàn thuyên về những mơ ước phía xa, đôi ba câu chuyện không đầu không cuối mà nói hết cả một ngày dài. Là những tháng ngày hồn nhiên không muộn phiền của cô gái nhỏ Mạt Mạt trong “Gửi thanh xuân ấm áp của chúng ta” bên bạn thân Mộng Lộ, Vương San và Đàn Chị. Những chất chứa trên những gương mặt thân quen cả đời này chẳng tài nào quên được, dường như khắc sâu vào tận đáy lòng để cô luôn thương nhớ suốt những ngày tháng về sau.',
N'Gửi cho thời thanh xuân ấm áp nhất của chúng ta.
Bạn đã bao giờ tự hỏi lòng mình, “thanh xuân” là gì hay chưa? 
Thanh xuân, là những thước phim quay chậm về những tháng ngày non nớt...',N'Img/GuiThanhXuanAmApCuaChungTa.jpg'),
(50,	N'Bàn Có Năm Chỗ Ngồi',	4, 1, 30000, 55000, 36,	N'Tác giả quen thuộc của thiếu nhi, của tuổi ô mai. Những tập truyện của anh luôn dí dỏm, hài hước, đem lại nhiều cảm xúc, nhiều bài học nhẹ nhàng cho lứa tuổi học trò. Hãy đọc để cùng gặp những nhân vật rất dễ thương, hoặc phải vượt qua những hoàn cảnh khó khăn, hoặc sẵn lòng chia sẻ với bạn bè, người thân… Thậm chí cả những nhân vật tạm gọi là “phe xấu” với nhiều trò đùa nghịch… cũng mang dáng dấp hồn nhiên. 
Tất cả hướng về CHÂN – THIỆN – MỸ. Họ là năm người bạn với năm cá tính và hoàn cảnh khác nhau cùng chung trong một lớp học. Những trò nghịch ngợm trẻ con đôi khi gây ra mâu thuẫn, nhưng trên tất cả đó là những đứa trẻ ham học, giàu lòng nhân ái và biết quan tâm đến bạn bè. Cảm thông với hoàn cảnh của nhau, từng bạn nghĩ ra cách giúp đỡ bạn mình theo khả năng để tình bạn ấy lớn dần theo năm tháng.',
N'Tác giả quen thuộc của thiếu nhi, của tuổi ô mai. Những tập truyện của anh luôn dí dỏm, hài hước, đem lại nhiều cảm xúc, nhiều bài học nhẹ nhàng cho lứa tuổi học trò...',N'Img/BanCoNamChoNgoi.jpg'),
(51,	N'Trước Vòng Chung Kết', 4, 1, 49600, 75000, 69, N'Tràn ngập không khí bóng đá, không khí vỉa hè… đậm mùi hào hiệp, thượng võ. Lẽ dĩ nhiên như cuộc đời, có đâu đó những mưu toan nhỏ nhen, những trò chơi bẩn… không đáng mặt anh hào. Nhưng... (chữ nhưng dành cho sự khám phá của các bạn).', N'Tràn ngập không khí bóng đá, không khí vỉa hè… đậm mùi hào hiệp, thượng võ. Lẽ dĩ nhiên...',N'Img/TruocVongChungKet.jpg'),
(52, N'Chuỗi Thói Quen',4,14,11200,159000,89, N'Chúng ta đều đã từng nghe lời khuyên này:

“Làm thế nào để ăn một con voi? Đó là cắn từng miếng một.”

Quan niệm ở đây chính là mỗi khi bạn phải đối mặt với một mục tiêu to lớn và đòi hỏi nhiều công đoạn phức tạp, tất cả những gì bạn cần làm là chia mục tiêu đó thành từng bước nhỏ.

Vậy “Làm thế nào để đạt đến một cuộc đời tối ưu về mọi mặt: sức khỏe, tài chính, sự nghiệp, các mối quan hệ…?”

Dễ thôi, vẫn là “chia mục tiêu đó thành từng bước nhỏ. Hãy tưởng tượng cuộc sống của bạn sẽ thay đổi như thế nào nếu mỗi ngày bạn thực hiện một chuỗi những hành động nhỏ có tác động tích cực đến đến mọi khía cạnh trong cuộc đời như tài chính, sức khỏe, sự nghiệp, các mối quan hệ…?

Nắm bắt tâm lý học hành vi con người, và nhận thấy sức mạnh không thể phủ nhận của chuỗi những hành động nhỏ kết hợp với nhau, trong cuốn sách này, tác giả S. J. Scott đã chia sẻ về khái niệm chồng thói quen, cũng như 127 thói quen nhỏ thuộc các lĩnh vực trọng yếu trong cuộc sống. Đọc cuốn sách này, và làm theo những gì tác giả đề cập, chắc chắn cuộc sống của bạn sẽ bước sang trang mới của sự hạnh phúc, viên mãn, và đủ đầy.', N'“Làm thế nào để ăn một con voi? Đó là cắn từng miếng một.”

Quan niệm ở đây chính là mỗi khi bạn ...',N'Img/ChuoiThoiQuen.jpg'),
(53,N'Xin Lỗi, Em Chỉ Là Con Đĩ!',10,9, 60000,75000,96,N'Một cuộc đời khiến người đọc phải lặng đi.
Một câu chuyện kể về cuộc đời đầy nước mắt của Hạ Âu. 
Hạ Âu gặp Hà Niệm Bân lần đầu tiên khi nàng 16 tuổi, nơi quán bar đang bật khúc nhạc đồng quê dịu nhẹ.
“Em có thể ngủ với ông” - đó là câu đầu tiên nàng nói, và còn nhắc lại một lần nữa với âm sắc kiên định hơn mọi tưởng tượng. Đêm đó, sau khi xong việc, Niệm Bân cho nàng 500 tệ rồi bảo đi. Ánh mắt lưu luyến của Hạ Âu lúc ấy có lẽ đã làm anh có ý nuối tiếc, nhưng vẫn lạnh lùng đóng sập cửa. Dù day dứt nhưng anh vẫn nhủ lòng - “Cô ta chỉ là một con đĩ, một con điếm kỳ dị”!
Nhưng đến lần gặp gỡ thứ hai thì anh đã quyết định "bao" Hạ Âu trong vòng hai năm. Hai năm ấy - con số không quá lớn nhưng cũng đủ dài để day dứt lòng người đến cuối cuộc đời…',N'Một cuộc đời khiến người đọc phải lặng đi.
Một câu chuyện kể về cuộc đời đầy nước mắt của ...',N'Img/XlEmchilacondi.jpg'),
(54, N'One Piece - Tập 85', 7, 16, 17000, 19500, 120, N'One Piece (Vua hải tặc) bộ thuộc thể loại truyện tranh Hành động kể về một cậu bé tên Monkey D. Luffy, giong buồm ra khơi trên chuyến hành trình tìm kho báu huyền thoại One Piece và trở thành Vua hải tặc. Để làm được điều này, cậu phải đến được tận cùng của vùng biển nguy hiểm và chết chóc nhất thế giới: Grand Line (Đại Hải Trình). Luffy đội trên đầu chiếc mũ rơm như một nhân chứng lịch sử vì chiếc mũ rơm đó đã từng thuộc về hải tặc hùng mạnh: Hải tặc vương Gol. D. Roger và tứ hoàng Shank "tóc đỏ". Luffy lãnh đạo nhóm hải tặc Mũ Rơm qua East Blue (Biển Đông) và rồi tiến đến Grand Line. Cậu theo dấu chân của vị vua hải tặc quá cố, Gol. D. Roger, chu du từ đảo này sang đảo khác để đến với kho báu vĩ đại.',N'One Piece (Vua hải tặc) bộ thuộc thể loại truyện tranh Hành động kể về một cậu bé tên ...', N'Img/OnePiece85.jpg'),
(55, N'Frozen - Lễ Hội Mùa Đông', 7, 11, 15000, 18000, 100, N'Elsa và Anna sẽ tổ chức một Lễ hội mùa đông để tưởng nhớ hoàng hậu đã mất.

Sẽ có những trò vui như hồi họ nhỏ, nhiều món ăn ngon lành. Và ấm áp nhất chính là những phút vui vầy bên nhau của hai chị em.',N'Elsa và Anna sẽ tổ chức một Lễ hội mùa đông để tưởng nhớ hoàng hậu đã mất.

Sẽ có những trò vui như hồi họ ...', N'Img/Frozen.jpg'),
(56, N'Cây Khế ', 7, 9, 22000, 28000, 150, N'Cuộc sống quanh ta có bao điều thú vị và mới lạ, nhất là với trẻ thơ. Không ít lần bố mẹ đã nghe bé thắc mắc: Tại sao hồ này có tên là hồ Hoàn Kiếm? Tại sao cây kia được gọi là cây xấu hổ? Tại sao nước biển lại mặn?... Tủ sách Cổ tích Việt Nam sẽ giúp bé trả lời những câu hỏi đó, đồng thời bổ sung thêm vốn từ tiếng Anh qua những câu chuyện bình dị, mang đậm tính nhân văn. ',N'Cuộc sống quanh ta có bao điều thú vị và mới lạ, nhất là với trẻ thơ. Không ít lần bố mẹ đã ...', N'Img/CayKhe.jpg'),
(57, N'Cây Tre Trăm Đốt', 7, 9, 22000, 28000, 150, N'Cuộc sống quanh ta có bao điều thú vị và mới lạ, nhất là với trẻ thơ. Không ít lần bố mẹ đã nghe bé thắc mắc: Tại sao hồ này có tên là hồ Hoàn Kiếm? Tại sao cây kia được gọi là cây xấu hổ? Tại sao nước biển lại mặn?... Tủ sách Cổ tích Việt Nam sẽ giúp bé trả lời những câu hỏi đó, đồng thời bổ sung thêm vốn từ tiếng Anh qua những câu chuyện bình dị, mang đậm tính nhân văn.',N'Cuộc sống quanh ta có bao điều thú vị và mới lạ, nhất là với trẻ thơ. Không ít lần bố mẹ đã ...', N'Img/CayTreTramDot.jpg'),
(58, N'Tập Tục Quê Em - Lễ Hội Katê', 7, 16, 20000, 230000, 150, N'Một sáng thức giấc, Phon bỗng thấy xung quanh xáo động, rộn ràng khác hẳn mọi ngày. Thì ra hôm nay là Tết Katê - một lễ hội quan trọng bậc nhất trong năm của đồng bào Chăm theo đạo Bà La Môn. Cùng với mẹ, Phon đã có một chuyến đi xem lễ thật vui và ý nghĩa, từ đến tháp đến làng, rồi đến từng gia đình.

Hãy dõi theo bước chân Phon, hòa mình vào buổi cầu nguyện trang nghiêm nơi đền tháp, sau đó tham dự những trò chơi hấp dẫn như múa quạt, dệt vải, đội nước… ở một ngôi làng điển hình của người Chăm, bạn nhé!',N'Một sáng thức giấc, Phon bỗng thấy xung quanh xáo động, rộn ràng khác hẳn mọi ngày. Thì ra hôm nay là ...', N'Img/TapTucQueEm.jpg'),
(59, N'Chuyện Kể Tối Mùa Hạ', 7, 16, 50000, 56000, 150, N'Chuyện Kể Tối Mùa Hạ là cuốn truyện thiếu nhi dành cho cá bé từ 2 - 6 tuổi, với dung lượng vừa đủ, câu chuyện chọn lọc, cuốn sách là cẩm nang cho các bậc phụ huynh trong việc đọc truyện cho con em mình.

Bé có biết:

- Mùa hạ rất nóng. Ông mặt trời chói chang. Vì thế, chúng ta đi ra ngoài phải luôn mang theo mũ nón hoặc ô để che nắng nhé! Trang phục của mùa hạ cũng nên chọn kiểu thoáng mát, dễ thấm mồ hôi.

- Mùa hạ, các bạn thường được bố mẹ cho đi biển chơi, hoặc đi lên các vùng núi cao để tránh nóng… Các bé đã được bố mẹ cho đi biển lần nào chưa nhỉ? Bé có biết ở biển có những gì không?

- Và còn điều này nữa: Có những loài hoa rực rỡ nở rộ vào mùa hạ như hoa phượng vĩ, hoa bằng lăng… Có những loài vật chỉ thấy xuất hiện trong mùa hạ như: ve sầu, đom đóm…

Còn bây giờ, hãy đọc những mẩu chuyện trong cuốn sách này, và tìm xem có thấy anh bạn đom đóm của mùa hạ xuất hiện không nhé!',N'Chuyện Kể Tối Mùa Hạ là cuốn truyện thiếu nhi dành cho cá bé từ 2 - 6 tuổi, với dung lượng vừa đủ, câu chuyện ...', N'Img/ChuyenKeToiMuaHa.jpg'),
(60, N'Chuyện Kể Tối Mùa Xuân', 7, 16, 50000, 56000, 150, N'Chuyện Kể Tối Mùa Xuân là cuốn truyện thiếu nhi dành cho cá bé từ 2 - 6 tuổi, với dung lượng vừa đủ, câu chuyện chọn lọc, cuốn sách là cẩm nang cho các bậc phụ huynh trong việc đọc truyện cho con em mình.

Bé có biết:

- Mùa xuân, trời ấm áp, muôn hoa đua nở… Những chú chim, ong, bướm rập rờn khắp muôn nơi… Vì thế mùa xuân thường được ví như cô gái xinh đẹp vậy!

- Mùa xuân cũng có những ngày mưa phùn ẩm ướt. Mưa rơi nhè nhẹ cùng với khí trời ấm áp giúp cây cối đâm chồi nảy lộc.

- Mùa xuân, có Tết cổ truyền. Vào ngày Tết, bé được mặc quần áo đẹp, đi chúc Tết ông bà và họ hàng, phải không nào?

- Mùa xuân còn có nhiều lễ hội. Bé đã được tham gia lễ hội nào chưa nhỉ? Hãy hỏi bố mẹ về những lễ hội này, và khi có dịp, bé hãy tới tham dự xem nhé! Các lễ hội đều rất vui đấy!

Còn bây giờ, hãy cùng đọc những mẩu chuyện ấm áp như mùa xuân trong cuốn sách này nhé.',N'Chuyện Kể Tối Mùa Xuân là cuốn truyện thiếu nhi dành cho cá bé từ 2 - 6 tuổi, với dung lượng vừa đủ, câu chuyện ...', N'Img/ChuyenKeToiMuaXuan.jpg');
GO

INSERT INTO dbo.SACHvaTACGIA
VALUES 
(1,		1),
(2,		2),
(3,		3),
(4,		2),
(5,		4),
(6,		5),
(7,		1),
(8,		6),
(9,		7),
(10,	8),
(11,	9),
(12,	10),
(13,	11),
(14,	1),
(15,	12),
(16,	9),
(17,	13),
(18,	13),
(19,	12),
(20,	9),
(21,	12),
(22,	17),
(23,	18),
(24,	18),
(25,	1),
(26,	19),
(27,	16),
(28,	19),
(29,	19),
(30,	20),
(31,	20),
(32,	19),
(33,	14),
(34,	21),
(35,	22),
(36,	21),
(37,	23),
(38,	22),
(39,	21),
(40,	23),
(41,	21),
(42,	23),
(43,	22),
(44,	23),
(45,	15),
(46,	24),
(47,	25),
(48,	1),
(49,	25),
(50,	1),
(51,	1),
(52,	18),
(53,	26),
(54,	27),
(55,	12),
(56,	12),
(57,	12),
(58,	12),
(59,	12),
(60,	12);
GO

INSERT INTO dbo.NGONNGU
VALUES
('TV',	N'Tiếng Việt'),
('TA',	N'Tiếng Anh'),
('TN',	N'Tiếng Nhật'),
('TH',	N'Tiếng Hàn'),
('TT',	N'Tiếng Trung');
GO

INSERT INTO dbo.CHITIETSACH
VALUES
('8934974158578',	1,	'TV',	236,	0.242,	'12 x 20 cm',	'2018-12-01'),
('9780142424179',	2,	'TA',	352,	0.396,	'14 x 20.9 x 2.1 cm',	'2014-04-01'),
('9789810973834',	3,	'TA',	NULL,	1.32,	'14 x 20.9 x 12.2 cm',	'2016-01-01'),
('9780142402511',	4,	'TA',	221,	0.258,	'14 x 20.9 x 2.1 cm',	'2006-12-01'),
('8935072882075',	5,	'TT',	166,	0.352,	'19 x 27 cm',	'2012-09-01'),
('8935086845233',	6,	'TH',	120,	0.176,	'14.5 x 20.5 cm',	'2018-06-01'),
('8934974159179',	7,	'TV',	208,	0.396,	'13 x 20 cm',	'2018-11-01'),
('9780545044257',	8,	'TA',	3422,	5.5,	'35.3 x 46 cm',	'2016-01-01'),
('9780451167712',	9,	'TA',	NULL,	0.301,	'11.5 x 19.6 x 3.1 cm',	NULL),
('8935210223647',	10,	'TN',	136,	0.242,	'17 x 24 cm',	'2017-11-01'),
('8934974158318',	11,	'TA',	324,	0.374,	'13 x 20 cm',	'2018-10-01'),
('8935251409086',	12,	'TV',	392,	0.616,	'16 x 24 cm',	'2018-07-01'),
('9780007155668',	13,	'TA',	192,	0.286,	'20.1 x 13.5 x 1.5 cm',	'2015-01-01'),
('8934974158226',	14,	'TV',	232,	0.264,	'13 x 20 cm',	'2018-01-01'),
('9786049700903',	15,	'TV',	88,		0.374,	'21 x 29 cm',	'2018-04-01'),
('8934974153177',	16,	'TV',	280,	0.242,	'13 x 18 cm',	'2018-03-01'),
('9786049694271',	17,	'TV',	196,	0.242,	'13 x 20.5 cm',	'2018-06-01'),
('8935092548920',	18,	'TV',	576,	0.88,	'16 x 24 cm',	'2018-04-01'),
('98935077036367',	19,	'TV',	480,	0.858,	'16 x 24 cm',	'2016-01-01'),
('1130000080517',	20,	'TV',	152,	0.154,	'13  x 20 cm',	'2015-12-01'),
('9786049690457',	21,	'TV',	308,	0.352,	'13.5 x 20.5 cm',	'2018-05-01'),
('9786045655412',	22,	'TA',	20,		0.132,	'25 x 26 cm',	'2018-09-01'),
('8935251405507',	23,	'TV',	180,	0.22,	'13 x 20.5 cm',	'2018-12-08'),
('8935251408300',	24,	'TV',	144,	0.154,	'13 x 20.5 cm',	'2018-08-01'),
('8934974158448',	25,	'TV',	376,	0.418,	'13 x 20 cm',	'2018-12-01'),
('8935086838143',	26,	'TV',	320,	0.352,	'14.5 x 20.5 cm',	'2016-09-06'),
('9786045654279',	27,	'TV',	128,	0.352,	'19 x 23 cm',	'2018-09-01'),
('8935095626946',	28,	'TV',	232,	0.286,	'13.5 x 20.5 cm',	'2018-12-01'),
('8935246919187',	29,	'TV',	268,	0.33,	'14.5 x 20.5 cm',	'2018-09-01'),
('8934974150510',	30,	'TV',	308,	0.33,	'13 x 20.5 cm',	'2017-09-01'),
('8934974151579',	31,	'TV',	268,	0.286,	'13 x 20.5 cm',	'2017-11-01'),
('8935246919170',	32,	'TV',	344,	0.418,	'14.5 x 20.5 cm',	'2018-07-01'),
('8934974157625',	33,	'TV',	416,	0.484,	'15.5 x 23 cm',	'2018-09-01'),
('9786045521465',	34,	'TV',	200,	0.22,	'13 x 20.5 cm',	'2017-01-05'),
('8935235210264',	35,	'TV',	292,	0.352,	'14 x 20.5 cm',	'2016-10-01'),
('8935077033106',	36,	'TV',	160,	0.198,	'13.5 x 20.5 cm',	'2016-01-01'),
('9786042075176',	37,	'TV',	184,	0.132,	'11.3 x 17.6 cm',	'2017-02-24'),
('8935235215801',	38,	'TV',	196,	0.242,	'14 x 20.5 cm',	'2018-03-01'),
('8936117740497',	39,	'TV',	216,	0.22,	'12 x 19 cm',	'2017-04-01'),
('9786042088206',	40,	'TV',	184,	0.132,	'11.3 x 17.6 cm',	'2017-05-26'),
('9786045652664',	41,	'TV',	256,	0.286,	'12.5 x 20 cm',	'2018-07-01'),
('9786042088213',	42,	'TV',	184,	0.132,	'11.3 x 17.6 cm',	'2017-10-27'),
('8935235217607',	43,	'TV',	412,	0.484,	'14 x 20.5 cm',	'2018-08-01'),
('9786042088220',	44,	'TV',	184,	0.132,	'11.3 x 17.6 cm',	'2018-03-01'),
('8934974158325',	45,	'TV',	308,	0.352,	'13 x 20.5 cm',	'2018-10-01'),
('8936071672773',	46,	'TV',	1780,	3.454,	'16 x 24 cm',	'2016-03-01'),
('8936062809164',	47,	'TV',	672,	0.858,	'14 x 20.5 cm',	'2017-12-01'),
('8934974158547',	48,	'TV',	228,	0.242,	'12 x 20 cm',	'2018-12-01'),
('8936062809249',	49,	'TV',	652,	0.814,	'14.5 x 20.5 cm',	'2018-03-01'),
('8934974158219',	50,	'TV',	180,	0.22,	'12 x 20 cm',	'2018-12-01'),
('8934974158493',	51,	'TV',	256,	0.264,	'12 x 20 cm',	'2019-03-01'),
('8935251406436',	52,	'TV',	416,	0.462,	'13 x 20.5 cm',	'2019-10-29'),
('9786049761904',	53,	'TV',	212,	0.264,	'13 x 20.5 cm',	'2019-07-01'),
('9786042111294',	54,	'TV',	196,	0.154,	'11.3 x 17.6 cm',	'2018-06-01'),
('8935244800937',	55,	'TV',	28,		0.176,	'17.5 x 23 cm',		'2015-01-01'),
('1130000090157',	56,	'TA',	24,		0.132,	'21 x 18.5 cm',		'2019-11-10'),
('1130000090158',	57,	'TA',	24,		0.132,	'21 x 18.5 cm',		'2019-11-10'),
('8935244807394',	58,	'TV',	20,		0.110,	'22 x 24 cm',		'2015-11-01'),
('9786042091749',	59,	'TV',	100,	0.198,	'16 x 19 cm',		'2017-09-01'),
('9786042091732',	60,	'TV',	96,		0.176,	'16 x 19 cm',		'2017-09-01');
GO

INSERT INTO dbo.KHACHHANG 
VALUES 
(4001,	N'Nguyễn Hữu Tài',	N'Nam',	'TaiNHHE130148@fpt.edu.vn', N'Đặng Văn Ngữ, Chùa Bộc, Đống Đa, Hà Nội', '0978590726', 'auriat', 'minhlatai', '2018-12-24',N'Img/Tairua.JPEG'),
(4004,	N'Trần Thành Đạt', N'Nam', 'DatTTHE130145@fpt.edu.vn',	N'Đại Học FPT, Thạch Thất, Hà Nội',	'0978590727', 'datfish','khongcomk','2018-12-06',N'Img/LungDattii.JPEG'),
(4007,	N'Bùi Lộc Xuân Trường',	N'Nam',	'TruongBLXHE130204@fpt.edu.vn',	N'Hạ Bằng, Thạch Thất, Hà Nội',	'0978590728', 'truongblx', 'deptrai123','2018-12-11',N'Img/TruongXoan.JPEG'),
(4010,	N'Nguyễn Dương Phong', N'Nam', 'PhongNDHE130315@fpt.edu.vn', N'Đại Học FPT, Thạch Thất, Hà Nội', '0978590729', 'deptraicogisai', 'matkhau1', '2018-12-16',N'Img/Phong.jpg'),
(4013,	N'Phùng Tất Đạt',	N'Nam', 'DatPTHE130350@fpt.edu.vn',	N'Hạ Bằng, Thạch Thất, Hà Nội',	'0976851521', 'phungdat213','dunghoi1',	'2018-12-11',N'Img/Dattii.JPEG'),
(4016,	N'Nguyễn Văn Mạnh', N'Nam', 'ManhNVHE130112@fpt.edu.vn', N'Đại Học FPT, Thạch Thất, Hà Nội', '0978590731', 'manhskymtp', '123456789','2018-11-26',N'Img/LungTai.JPEG'),
(4019,	N'Trịnh Nam Thái', N'Nam', 'ThaiTNHE130429@fpt.edu.vn',	N'Khương Thượng, Chùa Bộc, Đống Đa, Hà Nội', '0978590732', 'thai99hanoi', '35740112', '2018-12-01',N'Img/Thasi.JPEG'),
(4022,	N'Nguyễn Thúy Hằng',	N'Nữ', 'HangNTHE130461@fpt.edu.vn', N'Đại Học FPT, Thạch Thất, Hà Nội', '0978590733','hangmupmip', 'idontcare',	'2018-11-06',N'Img/LungLagger.JPEG'),
(4025,	N'Nguyễn Thị Hiếu',	N'Nữ', 'HieuNTHE130519@fpt.edu.vn', N'Đại Học FPT, Thạch Thất, Hà Nội', '0978590734', 'shophia','ahihihihia','2018-11-11',N'Img/LungPhong.JPEG'),
(4028,	N'Nguyễn Huy Thành', N'Nam', 'ThanhNHHE130698@gmail.com', N'Đại Học Bách Khoa, Hai Bà Trưng,  Hà Nội',	'0978590735', 'NaiChuoiChin', 'thanhthoimom', '2018-12-16',N'Img/DatDeep.JPEG'),
(4031,	N'Nguyễn Mai Tiên',	N'Nữ', 'TienMTHE130489@fpt.edu.vn',	N'Đại Học FPT, Thạch Thất, Hà Nội',	'0978590736', 'tienxinhgai', 'dobietmk', '2018-12-21',N'Img/CopyRight.JPEG'),
(4034,	N'Nguyễn Thái Dương', N'Nam', 'DuongNTHE1308900@fpt.edu.vn',N'Đại Học FPT, Thạch Thất, Hà Nội', '0978590737','congtuvandon', 'khianhyeutrieutraitimtanvo',	'2018-11-26', N'Img/Lagger.JPEG'),
(4037,	N'Đỗ Văn Long', N'Nam', 'LongDVHE130087@fpt.edu.vn', N'Gia Lâm, Long Biên, Hà Nội', '0978590738', 'longlilom', 'passla123', '2018-12-01',N'Img/F4(2).JPEG'),
(4040,	N'Nguyễn Viết Quân', N'Nam', 'QuanNVHE130006@fpt.edu.vn', N'Chùa Bộc, Đống Đa, Hà Nội', '0978590739','quankute', '987654321', '2018-11-06',N'Img/F4.JPEG');
GO

INSERT INTO dbo.DONHANG 
VALUES 
(1,	4001,  '2019-03-09', '2019-03-20',	 N'Đặng Văn Ngữ, Chùa Bộc, Đống Đa, Hà Nội', N'Nguyễn Hữu Tài', N'Đã nhận', N'Buổi sáng'),
(2,	4004,  '2019-03-10', '2019-03-20',	N'Đại Học FPT, Thạch Thất, Hà Nội', N'Trần Thành Đạt', N'Đã nhận', N'Buổi chiều'),
(3,	4007,  '2019-03-10', '2019-03-20',	N'Thôn 8, Hạ Bằng, Thạch Thất, Hà Nội', N'Bùi Lộc Xuân Trường',	N'Hủy hàng', N'Buổi sáng'),
(4,	4010,  '2019-03-12', '2019-03-21',	N'Đại Học FPT, Thạch Thất, Hà Nội', N'Nguyễn Dương Phong', N'Đã nhận', N'Buổi chiều'),
(5,	4013,  '2019-03-11', '2019-03-21',	N'Thôn 7, Hạ Bằng, Thạch Thất, Hà Nội', N'Phùng Tất Đạt', N'Đã nhận',	N'Buổi sáng'),
(6,	4013,  '2019-03-13', '2019-03-22',	N'15A Phương Mai, Đống Đa, Hà Nội', N'Nguyễn Văn Mạnh', N'Đã nhận',	N'Buổi sáng'),
(7,	4019,  '2019-03-13', '2019-03-22',	N'Khương Thượng, Chùa Bộc, Đống Đa, Hà Nội', N'Trịnh Nam Thái', N'Đã nhận', N'Buổi sáng'),
(8,	4022,  '2019-03-16', '2019-03-24',	N'Đại Học FPT, Thạch Thất, Hà Nội', N'Nguyễn Thúy Hằng', N'Đã nhận', N'Buổi sáng'),
(9,	4025,  '2019-03-16', '2019-03-24',	N'Đại Học FPT, Thạch Thất, Hà Nội', N'Nguyễn Thị Hiếu',	N'Đã nhận',	N'Buổi chiều'),
(10, 4028, '2019-03-14', '2019-03-22',	N'Bến xe Mỹ Đình, Mỹ Đình, Nam Từ Liêm, Hà Nội', N'Nguyễn Huy Thành', N'Đã nhận', N'Buổi chiều'),
(11, 4031, '2019-03-15', '2019-03-22',	N'Đại học FPT, Thạch Thất, Hà Nội',	N'Nguyễn Mai Tiên', N'Đã nhận', N'Buổi sáng'),
(12, 4034, '2019-03-18', '2019-03-26',	N'Đại học FPT, Thạch Thất, Hà Nộii', N'Nguyễn Thái Dươngt', N'Chưa giao', NULL),
(13, 4037, '2019-03-19', '2019-03-27',	N'TTTM Aeon Mail Long Biên, Long Biên, Hà Nội', N'Đỗ Văn Long', N'Chưa giao', NULL),
(14, 4040, '2019-03-20', '2019-03-28',	N'Chùa Bộc, Đống Đa, Hà Nộ',	N'Nguyễn Viết Quân', N'Chưa giao', NULL);
GO

INSERT INTO dbo.CHITIETDONHANG 
VALUES
(1,		1,	3,	58000),
(2,		2,	5,	280000),
(8,		3,	1,	4500000),
(9,		4,	5,	220000),
(14,	5,	6,	68000),
(16,	6,	7,	64000),
(19,	7,	10,	110000),
(45,	8,	6,	86000),
(36,	9,	7,	40000),
(35,	10,	1,	56000),
(22,	11,	5,	32000),
(21,	12,	9,	69000),
(18,	13,	6,	127000),
(10,	14,	7,	29000);
GO
create proc GetDetailSach2
@u int
as
begin
 SELECT SACH.TenSach,TACGIA.TenTacGia,SACH.GiaBia,SACH.GhiChuSach,SACH.AnhSach,SACH.TomTat
 From dbo.SACH 
       INNER JOIN dbo.SACHvaTACGIA ON SACHvaTACGIA.MaSach = SACH.MaSach
       INNER JOIN dbo.TACGIA ON SACHvaTACGIA.MaTacGia = TACGIA.MaTacGia
 ORDER BY SACH.MaSach
 OFFSET (@u-1)*15 ROWS
 FETCH NEXT 15 ROWS ONLY
end
go