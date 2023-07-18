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

CREATE INDEX idx_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medical_histories_id ON treatments_histories(medical_histories_id);
CREATE INDEX idx_treatments_id ON treatments_histories(treatments_id);