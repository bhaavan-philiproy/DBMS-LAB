create procedure book_issue_register()
    begin
    declare v_issueid integer;
    declare v_doi date;
    declare v_exp_dor date;
    declare v_memberid integer;
    declare flag integer default 0;
    declare cur cursor for select Issue_id,Date_of_issue,Expected_date_of_return,Member_id from Book_Issue;
    declare continue handler for not found set flag=1;
    open cur;
    get_list : loop
    fetch cur into
    v_issueid,v_doi,v_exp_dor,v_memberid;
    if flag=1 then
    leave get_list;
    end if;
    select concat(v_issueid,concat(':',concat(v_doi,concat(':',concat(v_exp_dor,concat(':',v_memberid))))))as register;
    end loop get_list;
    close cur;
    end /
