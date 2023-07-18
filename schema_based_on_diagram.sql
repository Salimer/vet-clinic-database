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

CREATE TABLE treatments(
    id SERIAL PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);
CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);
CREATE TABLE treatments_histories(
    medical_histories_id INT REFERENCES medical_histories(id),
    treatments_id INT REFERENCES treatments(id),
    PRIMARY KEY(medical_histories_id, treatments_id)
);