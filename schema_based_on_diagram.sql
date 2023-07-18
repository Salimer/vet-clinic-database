CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE
);

CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR
);

CREATE TABLE invoices(
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL(10, 2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT UNIQUE REFERENCES medical_histories(id)
);
