/*1. Создать VIEW запроса, сделанного в ДЗ 3. */

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `count_staff` AS
    SELECT 
        `departments`.`dept_name` AS `dept_name`,
        COUNT(`dept_emp`.`emp_no`) AS `count_of_emp`
    FROM
        (`dept_emp`
        JOIN `departments` ON ((`dept_emp`.`dept_no` = `departments`.`dept_no`)))
    GROUP BY `departments`.`dept_no`
    ORDER BY `count_of_emp` DESC

/*2. Создвать фукцию, которая найдет сотрудника по имени и фамилии. */

CREATE DEFINER=`root`@`localhost` FUNCTION `find_emp`(f_name char (16), l_name char (16)) 
RETURNS char(33) CHARSET utf8mb4
    READS SQL DATA
BEGIN

RETURN ( 
	select 
		emp_no/*, first_name, last_name, gender*/ 
	from 
		employees 
	where 
    first_name = f_name 
    and 
    last_name = l_name
    limit 1
    );
END

/*3. Создать триггер, который будет начислять бонус новому добавленному сотруднику.*/

CREATE DEFINER=`root`@`localhost` TRIGGER `employees_AFTER_INSERT` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
INSERT INTO `employees`.`salaries` (`emp_no`, `salary`, `from_date`, `to_date`) VALUES (NEW.emp_no, '5000', '2020-06-20', '2002-06-21');

END