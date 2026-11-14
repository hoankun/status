#!/bin/bash

pkill gitk 2>/dev/null          # đóng gitk cũ
cd "$(mktemp -d)"               # repo mới tinh, trống hoàn toàn

git init -b master
git config user.name "cung1"
git config user.email "abc@gmail.com"

git commit --allow-empty -m "root"

# Đổi tên nhánh hiện tại thành 'left' (Cột trái)
git branch -m left

# Rẽ nhánh 'right' (Cột phải) và tạo 2 commit
git checkout -b right
git commit --allow-empty -m "r1"
git commit --allow-empty -m "r2"

# ==========================================
# BƯỚC 2: TRÁI GOM PHẢI (Lần 1)
# ==========================================
git checkout left
git commit --allow-empty -m "l1"
# Lệnh này tạo ra đường chéo từ phải hướng xuống trái
git merge --no-ff right -m "Left merges Right 1"

# ==========================================
# BƯỚC 3: PHẢI GOM TRÁI (Lần 1)
# ==========================================
# Tạo thêm 1 commit trên trái để tạo khoảng cách
git commit --allow-empty -m "l2"

git checkout right
# Lệnh này tạo ra đường chéo từ trái hướng xuống phải
git merge --no-ff left -m "Right merges Left 1"

# ==========================================
# BƯỚC 4: TRÁI GOM PHẢI (Lần 2)
# ==========================================
# Tạo thêm 1 commit trên phải để tạo khoảng cách
git commit --allow-empty -m "r3"

git checkout left
git commit --allow-empty -m "l3"
git merge --no-ff right -m "Left merges Right 2"

# ==========================================
# BƯỚC 5: PHẢI GOM TRÁI (Lần 2 - Đỉnh đồ thị)
# ==========================================
# Tạo commit cuối cùng bên trái
git commit --allow-empty -m "l4"

git checkout right
# Tạo nốt vàng trên đỉnh đồ thị
git merge --no-ff left -m "Right merges Left 2"

# ==========================================
# BƯỚC 6: XÓA DẤU VẾT NHÁNH PHỤ
# ==========================================
# Đổi tên nhánh right hiện tại thành 'master'
git branch -m master
# Xóa nhánh left để giao diện gitk chỉ hiện 1 nhãn 'master' giống hệt ảnh
git branch -d left

# ==========================================
# KẾT QUẢ
# ==========================================
echo "Đã tạo xong đồ thị đan chéo! Mở gitk..."
gitk --all &