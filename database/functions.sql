DELIMITER ??
CREATE FUNCTION check_user_is_the_same_conversation(user_id1 bigint, user_id2 bigint)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    declare number_conversation int;
    set number_conversation = (select count(*) from(
        select conversation_id, count(user_id) as number_of_users
        from participants
        where user_id in(user_id1,user_id2)
        group by conversation_id
        having number_of_users > 1
    ) cp);
    IF (number_conversation > 0) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    end if;
end??
select check_user_is_the_same_conversation(1,26);

drop function check_user_is_the_same_conversation;