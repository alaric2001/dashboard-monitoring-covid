
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    role_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL
);

CREATE TABLE permissions (
    permission_id INT PRIMARY KEY,
    permission_name VARCHAR(255) NOT NULL
);

CREATE TABLE role_permissions (
    role_id INT,
    permission_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id),
    PRIMARY KEY (role_id, permission_id)
);

CREATE TABLE pasien (
    id INT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    alamat VARCHAR(255) NOT NULL
);


CREATE TABLE full_biodata (
    pasien_id INT PRIMARY KEY,
    pekerjaan VARCHAR(255) NOT NULL,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    agama VARCHAR(255),
    nomor_telepon VARCHAR(255),
    status_pernikahan ENUM('Belum Menikah', 'Menikah', 'Cerai'),
    FOREIGN KEY (pasien_id) REFERENCES pasien(id)
);

CREATE TABLE dokter (
    id INT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    spesialisasi VARCHAR(255) NOT NULL,
    nomor_telepon VARCHAR(20),
    alamat VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE rekam_medis (
    id INT PRIMARY KEY,
    pasien_id INT,
    dokter_id INT,
    tanggal DATE NOT NULL,
    keluhan TEXT,
    oxygen_saturation INT,
    temperature VARCHAR(255),
    respiratiry_rate VARCHAR(255),
    pulse_rate VARCHAR(255),
    FOREIGN KEY (pasien_id) REFERENCES pasien(id),
    FOREIGN KEY (dokter_id) REFERENCES dokter(id)
);

CREATE TABLE hasil_lab_pasien (
    id INT PRIMARY KEY,
    pasien_id INT,
    dokter_id INT,
    tanggal DATE NOT NULL,
    hasil VARCHAR(255) NOT NULL,
    FOREIGN KEY (pasien_id) REFERENCES pasien(id),
    FOREIGN KEY (dokter_id) REFERENCES dokter(id)
);


CREATE TABLE covid19 (
    id INT PRIMARY KEY,
    pasien_id INT,
    tanggal_tes DATE NOT NULL,
    hasil_tes ENUM('Negatif', 'Positif') NOT NULL,
    kondisi_pasien VARCHAR(255),
    FOREIGN KEY (pasien_id) REFERENCES pasien(id)
);






