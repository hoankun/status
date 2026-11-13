pkill gitk 2>/dev/null     # đóng cửa sổ gitk của lần chạy trước
cd ~
rm -rf git-lab             # xóa hẳn repo cũ
mkdir git-lab && cd git-lab

git init -b master
git config user.name "cung"
git config user.email "engo2665@gmail.com"

# master: commit đầu
git commit --allow-empty -m "C1"

# feature-b: rẽ từ C1, 2 commit, không merge
git checkout -b feature-b
git commit --allow-empty -m "b1"
git commit --allow-empty -m "b2"

# quay về master, thêm C2
git checkout master
git commit --allow-empty -m "C2"

# feature-a: rẽ từ C2, 3 commit
git checkout -b feature-a
git commit --allow-empty -m "a1"
git commit --allow-empty -m "a2"
git commit --allow-empty -m "a3"

# quay về master, thêm C3, C4 rồi merge feature-a
git checkout master
git commit --allow-empty -m "C3"
git commit --allow-empty -m "C4"
git merge --no-ff feature-a -m "Merge feature-a"

# commit cuối trên master
git commit --allow-empty -m "C5"

# mở gitk hiển thị tất cả nhánh
gitk --all &
