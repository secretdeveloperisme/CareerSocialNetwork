DELIMITER $$
CREATE TRIGGER update_application_status
    AFTER UPDATE ON applications
    FOR EACH ROW
BEGIN
    IF NEW.status = 'COMPLETED' THEN
        UPDATE jobs SET amount = amount - 1 where jobs.job_id = NEW.job_id;
    ELSEIF OLD.status = 'COMPLETED' AND NEW.status != 'COMPLETED' THEN
        UPDATE jobs SET amount = amount + 1 where jobs.job_id = NEW.job_id;
    END IF;
end; $$