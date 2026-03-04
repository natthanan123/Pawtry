-- 1. ตาราง users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL
);

-- 2. ตาราง categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 3. ตาราง statuses
CREATE TABLE statuses (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    color_code VARCHAR(20)
);

-- 4. ตาราง tasks
CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category_id INT,
    status_id INT,
    created_by INT,
    assigned_to INT,
    due_date DATETIME,
    
    -- กำหนด Foreign Keys
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL,
    FOREIGN KEY (status_id) REFERENCES statuses(status_id) ON DELETE SET NULL,
    FOREIGN KEY (created_by) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES users(user_id) ON DELETE SET NULL
);

-- --- ข้อมูลตั้งต้น (Mock Data) สำหรับทดสอบ API ---
INSERT INTO users (username) VALUES ('admin_jane'), ('dev_john');
INSERT INTO categories (name, description) VALUES ('IT', 'Tech and infrastructure'), ('HR', 'Human resources');
INSERT INTO statuses (name, color_code) VALUES ('To Do', '#cccccc'), ('In Progress', '#007bff'), ('Done', '#28a745');
INSERT INTO tasks (title, description, category_id, status_id, created_by, assigned_to, due_date)
VALUES ('Setup Backend API', 'Create Express server with Zod', 1, 2, 1, 2, '2026-03-05 17:00:00');