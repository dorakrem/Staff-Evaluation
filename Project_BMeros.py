
from tkinter import *
from PIL import ImageTk, Image
from tkinter import messagebox
import mysql.connector


root = Tk()


root.title('Login')
root.iconbitmap("C:/Users/dorak/Downloads/lock.ico")
root.geometry('300x250')


Label(root,text="Welcome User! \n Please enter Account details").pack()
Label(root,text="").pack()




def seperate_users():

        #Manager User
    mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
    )

    my_cursor = mydb.cursor()

    my_cursor.execute("SELECT password FROM user WHERE password = %s AND username = %s", (password_entry.get(),username_entry.get()))
    my_result = my_cursor.fetchone()
    if(my_result==None):
        messagebox.showerror("Error","Invalid Password.Try again!")
    else:
        my_cursor.execute("SELECT * FROM manager WHERE managerUsername = %s",(username_entry.get(),))
        my_resul = my_cursor.fetchone()


        if(my_resul != None):
            top = Toplevel()
            top.title("Manager Options " + username_entry.get())
            top.geometry('750x450')
            top.iconbitmap("C:/Users/dorak/Downloads/manager_icon.ico")

            manag_lbl = Label(top,text="Choose an option:").pack()
            global r
            r= IntVar()
            r1= Radiobutton(top,text="Change company's details except AFM,DOY and name.",variable=r,value=1).place(x=10,y=60)
            r2= Radiobutton(top,text="Change your password and email.",variable=r,value=2).place(x=10,y=100)
            r3= Radiobutton(top,text="Change salary of a job in your company.",variable=r,value=3).place(x=10,y=140)
            r4= Radiobutton(top,text="Show evaluation results for jobs that have been fully evaluated in your company.",variable=r,value=4).place(x=10,y=180)
            r5= Radiobutton(top,text="Show average evaluation grade per evaluator for every evaluator in your company.",variable=r,value=5).place(x=10,y=220)
            r6= Radiobutton(top,text="Show and change employee's details (sistatikes,certificates,awards).",variable=r,value=6).place(x=10,y=260)
            r7= Radiobutton(top,text="Give an employee's name and surname to see "+
                    "1) their requests 2) evaluation results and 3) name and surname of their evaluator.",variable=r,value=7).place(x=10,y=300)




            button_continue = Button(top,text="Click here to continue",width=20,height=2,command=check_radiobuttonsformanager)
            button_continue.place(x=300,y=360)
            my_cursor.close()
            mydb.close()

        #Evaluator User

        mydb = mysql.connector.connect(
                host="localhost",
                user="root",
                password="Dora123krem",
                database="staffevaluation"
        )

        my_cursor = mydb.cursor()

        my_cursor.execute("SELECT * FROM evaluator WHERE username = %s", (username_entry.get(),))
        resultev = my_cursor.fetchone()
        if(resultev!=None):
                window_eval=Toplevel()
                window_eval.title("Evaluator options "+ username_entry.get())
                window_eval.geometry('750x450')
                window_eval.iconbitmap("C:/Users/dorak/Downloads/evaluator.ico")

                evalu_lbl = Label(window_eval, text="Choose an option:")
                evalu_lbl.pack()

                global e
                e = IntVar()
                e1 = Radiobutton(window_eval, text="See your file and change you details. You cannot change your username!", variable=e, value=1).place(x=10, y=60)
                e2 = Radiobutton(window_eval, text="Show promotion job details and update only those you announced.", variable=e, value=2).place(x=10,y=100)
                e3 = Radiobutton(window_eval, text="Add a new promotion job.", variable=e, value=3).place(x=10,y=140)
                e4 = Radiobutton(window_eval,text="See and update all the jobs that you have announced.",variable=e, value=4).place(x=10, y=180)
                e5 = Radiobutton(window_eval,text="Show number of requests for the jobs you have announced and process evaluation data", variable=e, value=5).place(x=10, y=220)
                e6 = Radiobutton(window_eval, text="Give id of a job that you have announced and see evaluations results (telika kai endiamesa).",variable=e, value=6).place(x=10, y=260)
                e7 = Radiobutton(window_eval, text="Show all jobs in your company and change only those you announced.", variable=e, value=7).place(x=10, y=300)

                button_continue = Button(window_eval, text="Click here to continue", width=20, height=2, command=check_radiobuttonsforevaluator)
                button_continue.place(x=300, y=360)
                my_cursor.close()
                mydb.close()

        #Employee User

        mydb = mysql.connector.connect(
                host="localhost",
                user="root",
                password="Dora123krem",
                database="staffevaluation"
        )

        my_cursor = mydb.cursor()

        my_cursor.execute("SELECT * FROM employee WHERE username = %s", (username_entry.get(),))
        my_resultem = my_cursor.fetchone()

        if (my_resultem != None):
                empl = Toplevel()
                empl.title("Employee Options " + username_entry.get())
                empl.geometry('600x400')
                empl.iconbitmap("C:/Users/dorak/Downloads/employee.ico")

                empl_lpl = Label(empl, text="Choose one option:").pack()
                global v
                v = IntVar()
                v1 = Radiobutton(empl, text="See your file and change your password and bio.", variable=v, value=1).place(x=10, y=60)
                v2 = Radiobutton(empl, text="Request for an available promotion job.", variable=v, value=2).place(x=10,y=110)
                v3 = Radiobutton(empl, text="Show all requests(promotion and evaluation).", variable=v, value=3).place(x=10, y=160)
                v4 = Radiobutton(empl, text="Delete an evaluation request if the job is still available.", variable=v, value=4).place(x=10, y=210)

                button_continue = Button(empl, text="Click here to continue", width=20, height=2, command=check_radiobuttonsforemployee).place(x=230, y=320)
                my_cursor.close()
                mydb.close()

        #Administrattor User

        mydb = mysql.connector.connect(
                    host="localhost",
                    user="root",
                    password="Dora123krem",
                    database="staffevaluation"
        )

        my_cursor = mydb.cursor()
        my_cursor.execute("SELECT * FROM administrator WHERE username = %s", (username_entry.get(),))
        my_resultad = my_cursor.fetchone()
        if(my_resultad!=None):
                 admin_win = Toplevel()
                 admin_win.title("Administrator Options " + username_entry.get())
                 admin_win.geometry('400x320')
                 admin_win.iconbitmap("C:/Users/dorak/Downloads/admin.ico")

                 admin_lbl = Label(admin_win, text="Choose an option:")
                 admin_lbl.pack()

                 global a
                 a = IntVar()
                 a1 = Radiobutton(admin_win, text="Create Manager,Evaluator and Employee Accounts.", variable=a, value=1).place(x=10, y=60)
                 a2 = Radiobutton(admin_win, text="Add new companies and antikeimena.",variable=a, value=2).place(x=10, y=100)

                 button_continue = Button(admin_win, text="Click here to continue", width=20, height=2,command=check_radiobuttonsforadmin)
                 button_continue.place(x=120, y=210)
                 my_cursor.close()
                 mydb.close()


def check_radiobuttonsforemployee():

    if(v.get() == 1):
        empl2=Toplevel()
        empl2.title("Your employee file " +  username_entry.get())
        empl2.geometry("450x320")

        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()

        my_cursor.callproc('blepeifakelo', [username_entry.get(), ])
        for apotelesma1 in my_cursor.stored_results():
           print(apotelesma1.fetchall())


        update_bio_password=Button(empl2,text="Click to update \n your password and bio",width=30,height=3,command=employee_updatebio_password)
        update_bio_password.pack()
        my_cursor.close()
        mydb.close()

    elif(v.get()==2):
        empl3 = Toplevel()
        empl3.title("Request for an available promotion job.")
        empl3.geometry("400x250")

        label3 = Label(empl3, text="Enter the promotion job id:")
        label3.pack()

        label_id = Label(empl3, text="Promotion job id:")
        label_id.place(x=10,y=100)
        id_entry = Entry(empl3, width=15)
        id_entry.place(x=125,y=100)
        print(id_entry.get())
        request_button = Button(empl3, text="Click here to request", width=20, height=2,command=lambda:employee_request(id_entry.get()))
        request_button.place(x=120, y=190)

    elif(v.get()==3):
        empl4 = Toplevel()
        empl4.title("All evaluation requests")
        empl4.geometry("500x350")


        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )
        my_cursor = mydb.cursor()
        print("Evaluation requests:")
        my_cursor.execute('SELECT * FROM requestsevaluation WHERE empl_usrname = %s',(username_entry.get(),))
        for row in my_cursor:
            print(row)
        print("Promotion requests:")
        my_cursor.execute('SELECT * FROM requestspromotion WHERE emplo_username = %s', (username_entry.get(),))

        for row in my_cursor:
            print(row)
        my_cursor.close()
        mydb.close()


    elif(v.get()==4):
        empl5 = Toplevel()
        empl5.title("Delete an evaluation request")
        empl5.geometry("400x250")

        label_del=Label(empl5,text="Give the job's id to delete the request for this job:")
        label_del.pack()
        Label(empl5,text="").pack()
        label_del_id=Label(empl5,text="Job Id:")
        label_del_id.place(x=10,y=100)
        del_id_entry=Entry(empl5,width=20)
        del_id_entry.place(x=90,y=100)

        request_button = Button(empl5, text="Click to delete request", width=20, height=2,command=lambda: employee_deleterequest(del_id_entry.get()))
        request_button.place(x=120, y=190)

#DEN DOULEYEI

def employee_deleterequest(delpromid):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )
    my_cursor = mydb.cursor()

    my_cursor.execute("DELETE FROM requestsevaluation WHERE job_id=%s AND empl_usrname=%s ",[delpromid,username_entry.get()])
    mydb.commit()
    messagebox.showinfo("Information","The request has been deleted succesfully.")

def employee_request(id):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(id==""):
        messagebox.showerror("Error","Please give an id to request!")
    else:
        my_cursor.callproc('requestforjob_promotion', [username_entry.get(),id])
        mydb.commit()
        for apotelesma2 in my_cursor.stored_results():
            if((apotelesma2.fetchall())==[('You have requested for this job.',)]):
                messagebox.showerror("Error","You have already requested for this job!")
            else:
                messagebox.showinfo("Information","You have requested for this job successfully.")
        my_cursor.close()
        mydb.close()


def employee_updatebio_password():

    empl1=Toplevel()
    empl1.title("Change password and bio")
    empl1.geometry("400x300")

    label1 = Label(empl1, text="Enter the details to be changed in your profile:")
    label1.pack()

    Label(empl1, text="").pack()
    Label(empl1, text="").pack()

    label_password = Label(empl1, text="Password:")
    label_password.place(x=10, y=90)
    password1_entry = Entry(empl1, width=25)
    password1_entry.place(x=80, y=90)
    print(password1_entry.get())

    label_bio = Label(empl1, text="Bio:")
    label_bio.place(x=10, y=160)
    bio_entry = Entry(empl1, width=25)
    bio_entry.place(x=80, y=160)
    print(bio_entry.get())

    change_button = Button(empl1, text="Change", width=10, height=2,command=lambda:employee_change_biopassword(password1_entry.get(), bio_entry.get()))
    change_button.place(x=150, y=220)



def employee_change_biopassword(password,bio):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )
    my_cursor = mydb.cursor()

    if (bio == "" or password == ""):
        messagebox.showerror("Error", "Please fill out the fields!")
    else:
        my_cursor.execute('Update employee set bio=%s WHERE username =%s',(bio,username_entry.get()))
        my_cursor.execute('Update user set password=%s WHERE username=%s',(password,username_entry.get()))
        mydb.commit()
        messagebox.showinfo("Information","Your password and bio have been changed succesfully.")

    my_cursor.close()
    mydb.close()


def check_radiobuttonsforadmin():

    if(a.get()==1):
        window_admin = Toplevel()
        window_admin.title("Dimiourgia logariasmwn")
        window_admin.geometry('400x320')

        label_ad1=Label(window_admin,text='Choose which Account you want to create:')
        label_ad1.pack()
        global c
        c = IntVar()

        c1 = Radiobutton(window_admin, text="Add Manager Account", variable=c, value=1).place(x=10, y=60)
        c2 = Radiobutton(window_admin, text="Add Evaluator Account", variable=c, value=2).place(x=10, y=100)
        c3 = Radiobutton(window_admin, text="Add Employee Account", variable=c, value=3).place(x=10, y=140)
        continue_bton = Button(window_admin, text="Continue", width=10, height=2,command=checkbuttonsforadmin1)
        continue_bton.place(x=150,y=210)


    elif(a.get()==2):
        admin_win1 = Toplevel()
        admin_win1.title("Dimiourgia etaireiwn kai antikeimenwn")
        admin_win1.geometry('380x300')

        label_ad2 = Label(admin_win1, text='Choose which one you want to add:')
        label_ad2.pack()
        global o
        o = IntVar()
        o1 = Radiobutton(admin_win1, text="Insert a new Company.", variable=o, value=1).place(x=10, y=70)
        o2 = Radiobutton(admin_win1, text="Insert a new antikeimeno.", variable=o, value=2).place(x=10, y=110)

        continue_bton = Button(admin_win1, text="Continue", width=10, height=2, command=checkbuttonsforadmin2)
        continue_bton.place(x=150, y=210)


def checkbuttonsforadmin2():
    if(o.get()==1):
        admin_win2 = Toplevel()
        admin_win2.title("Insert a new Company")
        admin_win2.geometry('450x350')

        label = Label(admin_win2, text="Fill out the next fields to add a new Company.")
        label.pack()

        label_AFM=Label(admin_win2,text="AFM:")
        label_AFM.place(x=10,y=50)

        AFM_entry=Entry(admin_win2,width=25)
        AFM_entry.place(x=90,y=50)

        label_DOY=Label(admin_win2,text="DOY:")
        label_DOY.place(x=10,y=80)

        DOY_entry=Entry(admin_win2,width=25)
        DOY_entry.place(x=90,y=80)

        label_name=Label(admin_win2,text="Name:")
        label_name.place(x=10,y=110)

        name_entry=Entry(admin_win2,width=25)
        name_entry.place(x=90,y=110)

        label_phone=Label(admin_win2,text="Phone:")
        label_phone.place(x=10,y=140)

        companyph_entry = Entry(admin_win2, width=25)
        companyph_entry.place(x=90, y=140)

        label_street=Label(admin_win2,text="Street:")
        label_street.place(x=10,y=170)

        companystreet_entry=Entry(admin_win2,width=25)
        companystreet_entry.place(x=90,y=170)

        label_num=Label(admin_win2,text="Number:")
        label_num.place(x=10,y=200)

        companynum_entry=Entry(admin_win2,width=25)
        companynum_entry.place(x=90,y=200)

        label_city=Label(admin_win2,text="City:")
        label_city.place(x=10,y=230)

        companycity_entry=Entry(admin_win2,width=25)
        companycity_entry.place(x=90,y=230)

        label_country=Label(admin_win2,text="Country:")
        label_country.place(x=10,y=260)

        companycountry_entry=Entry(admin_win2,width=25)
        companycountry_entry.place(x=90,y=260)
        insert_button = Button(admin_win2, text="Insert", width=10, height=2,command=lambda :insertcompany(AFM_entry.get(),DOY_entry.get(),name_entry.get(),companyph_entry.get(),companystreet_entry.get(),companynum_entry.get(),companycity_entry.get(),companycountry_entry.get()))
        insert_button.place(x=160,y=290)

    elif(o.get()==2):
        admin_win3 = Toplevel()
        admin_win3.title("Insert a new Antikeimeno")
        admin_win3.geometry('400x310')

        label = Label(admin_win3, text="Fill out the next fields to add a new Antikeimeno.")
        label.pack()

        label_title=Label(admin_win3,text="Title:")
        label_title.place(x=10,y=80)

        title_entry=Entry(admin_win3,width=40)
        title_entry.place(x=100,y=80)

        label_descr=Label(admin_win3,text="Description:")
        label_descr.place(x=10,y=110)

        descr_entry=Entry(admin_win3,width=40)
        descr_entry.place(x=100,y=110)

        label_belongs_to=Label(admin_win3,text="Belongs to:")
        label_belongs_to.place(x=10,y=140)

        belongs_to_entry=Entry(admin_win3,width=40)
        belongs_to_entry.place(x=100,y=140)


        insert_button=Button(admin_win3,text="Click to insert",width=20, height=2,command= lambda :insertantikeim(title_entry.get(),descr_entry.get(),belongs_to_entry.get()))
        insert_button.place(x=120,y=210)


def insertantikeim(title,descr,belongsto):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if (title == '' or descr == '' or belongsto == ''):
        messagebox.showerror("Error", "Please fill out the fields to enter a new Antikeimeno!")
    else:
        my_cursor.execute('INSERT INTO antikeim VALUES(%s,%s,%s)',[title,descr,belongsto])
        mydb.commit()
        messagebox.showinfo("Information","The new antikeimeno has been inserted succesfully.")
        my_cursor.close()
        mydb.close()



def insertcompany(AFM,DOY,name,phone,street,num,city,country):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()

    if(AFM=='' or DOY=='' or name=='' or phone=='' or street=='' or num=='' or city=='' or country==''):
        messagebox.showerror("Error","Please fill out the fields to enter a new Company!")
    else:
        my_cursor.execute('INSERT INTO company VALUES(%s,%s,%s,%s,%s,%s,%s,%s)',[AFM,DOY,name,phone,street,num,city,country])
        mydb.commit()
        messagebox.showinfo("Information","The new company has been inserted succesfully.")
        my_cursor.close()
        mydb.close()

def checkbuttonsforadmin1():

    if(c.get()==1):
        window_admin1 = Toplevel()
        window_admin1.title("Add Manager Account")
        window_admin1.geometry('450x350')

        label=Label(window_admin1,text="Fill out the next fields to insert a new Manager Account.")
        label.pack()

        label_manag_username = Label(window_admin1,text="Username:")
        label_manag_username.place(x=10,y=50)

        manag_username_entry = Entry(window_admin1,width=30)
        manag_username_entry.place(x=150,y=50)

        label_manag_password = Label(window_admin1,text="Password:")
        label_manag_password.place(x=10,y=80)

        manag_password_entry = Entry(window_admin1,width=30)
        manag_password_entry.place(x=150,y=80)

        label_manag_name = Label(window_admin1,text="Name:")
        label_manag_name.place(x=10,y=110)

        manag_name_entry = Entry(window_admin1,width=30)
        manag_name_entry.place(x=150,y=110)

        label_manag_surname = Label(window_admin1,text="Surname:")
        label_manag_surname.place(x=10,y=140)

        manag_surname_entry = Entry(window_admin1,width=30)
        manag_surname_entry.place(x=150,y=140)

        label_manag_email = Label(window_admin1,text="Email:")
        label_manag_email.place(x=10,y=170)

        manag_email_entry = Entry(window_admin1,width=30)
        manag_email_entry.place(x=150,y=170)

        label_manag_exp_years = Label(window_admin1,text="Years of experience:")
        label_manag_exp_years.place(x=10,y=200)

        manag_exp_years_entry = Entry(window_admin1,width=30)
        manag_exp_years_entry.place(x=150,y=200)

        label_manag_firm = Label(window_admin1,text="Company:")
        label_manag_firm.place(x=10,y=230)

        manag_firm_entry = Entry(window_admin1,width=30)
        manag_firm_entry.place(x=150,y=230)

        insert_button=Button(window_admin1,text="Insert",width=10,height=2,command=lambda :admin_insertmanager(manag_username_entry.get(),manag_password_entry.get(),manag_name_entry.get(),manag_surname_entry.get(),manag_email_entry.get(),manag_exp_years_entry.get(),manag_firm_entry.get()))
        insert_button.place(x=165,y=265)


    elif(c.get()==2):
        window_admin2 = Toplevel()
        window_admin2.title("Add Evaluator Account")
        window_admin2.geometry('450x350')

        label = Label(window_admin2, text="Fill out the next fields to insert a new Evaluator Account.")
        label.pack()

        label_eval_username = Label(window_admin2, text="Username:")
        label_eval_username.place(x=10, y=50)

        eval_username_entry = Entry(window_admin2, width=30)
        eval_username_entry.place(x=150, y=50)

        label_eval_password = Label(window_admin2, text="Password:")
        label_eval_password.place(x=10, y=80)

        eval_password_entry = Entry(window_admin2, width=30)
        eval_password_entry.place(x=150, y=80)

        label_eval_name = Label(window_admin2, text="Name:")
        label_eval_name.place(x=10, y=110)

        eval_name_entry = Entry(window_admin2, width=30)
        eval_name_entry.place(x=150, y=110)

        label_eval_surname = Label(window_admin2, text="Surname:")
        label_eval_surname.place(x=10, y=140)

        eval_surname_entry = Entry(window_admin2, width=30)
        eval_surname_entry.place(x=150, y=140)

        label_eval_email = Label(window_admin2, text="Email:")
        label_eval_email.place(x=10, y=170)

        eval_email_entry = Entry(window_admin2, width=30)
        eval_email_entry.place(x=150, y=170)

        label_eval_exp_years = Label(window_admin2, text="Years of experience:")
        label_eval_exp_years.place(x=10, y=200)

        eval_exp_years_entry = Entry(window_admin2, width=30)
        eval_exp_years_entry.place(x=150, y=200)

        label_eval_firm = Label(window_admin2, text="Company:")
        label_eval_firm.place(x=10, y=230)

        eval_firm_entry = Entry(window_admin2, width=30)
        eval_firm_entry.place(x=150, y=230)

        insert_button = Button(window_admin2, text="Insert", width=10, height=2,command= lambda :admin_insertevaluator(eval_username_entry.get(),eval_password_entry.get(),eval_name_entry.get(),eval_surname_entry.get(),eval_email_entry.get(),eval_exp_years_entry.get(),eval_firm_entry.get()))
        insert_button.place(x=165, y=265)

    elif(c.get()==3):
        window_admin3 = Toplevel()
        window_admin3.title("Add Employee Account")
        window_admin3.geometry('520x460')

        label = Label(window_admin3, text="Fill out the next fields to insert a new Employee Account.")
        label.pack()

        label_e_username = Label(window_admin3, text="Username:")
        label_e_username.place(x=10, y=50)

        e_username_entry = Entry(window_admin3, width=30)
        e_username_entry.place(x=150, y=50)

        label_e_password = Label(window_admin3, text="Password:")
        label_e_password.place(x=10, y=80)

        e_password_entry = Entry(window_admin3, width=30)
        e_password_entry.place(x=150, y=80)

        label_e_name = Label(window_admin3, text="Name:")
        label_e_name.place(x=10, y=110)

        e_name_entry = Entry(window_admin3, width=30)
        e_name_entry.place(x=150, y=110)

        label_e_surname = Label(window_admin3, text="Surname:")
        label_e_surname.place(x=10, y=140)

        e_surname_entry = Entry(window_admin3, width=30)
        e_surname_entry.place(x=150, y=140)

        label_e_email = Label(window_admin3, text="Email:")
        label_e_email.place(x=10, y=170)

        e_email_entry = Entry(window_admin3, width=30)
        e_email_entry.place(x=150, y=170)

        label_e_exp_years = Label(window_admin3, text="Years of experience:")
        label_e_exp_years.place(x=10, y=200)

        e_exp_years_entry = Entry(window_admin3, width=30)
        e_exp_years_entry.place(x=150, y=200)

        label_e_bio= Label(window_admin3,text="Bio:")
        label_e_bio.place(x=10,y=230)

        e_bio_entry = Entry(window_admin3,width=30)
        e_bio_entry.place(x=150,y=230)

        label_e_sistatikes = Label(window_admin3, text="Sistatikes:")
        label_e_sistatikes.place(x=10, y=260)

        e_sistatikes_entry = Entry(window_admin3, width=30)
        e_sistatikes_entry.place(x=150, y=260)

        label_e_certificates = Label(window_admin3, text="Certificates:")
        label_e_certificates.place(x=10, y=290)

        e_certificates_entry = Entry(window_admin3, width=30)
        e_certificates_entry.place(x=150, y=290)

        label_e_awards = Label(window_admin3, text="Awards:")
        label_e_awards.place(x=10, y=320)

        e_awards_entry = Entry(window_admin3, width=30)
        e_awards_entry.place(x=150, y=320)

        label_e_firm = Label(window_admin3, text="Company:")
        label_e_firm.place(x=10, y=350)

        e_firm_entry = Entry(window_admin3, width=30)
        e_firm_entry.place(x=150, y=350)

        insert_button = Button(window_admin3, text="Insert", width=10, height=2,command= lambda :admin_insertemployee(e_username_entry.get(),e_password_entry.get(),e_name_entry.get(),e_surname_entry.get(),e_email_entry.get(),e_exp_years_entry.get(),e_bio_entry.get(),e_sistatikes_entry.get(),e_certificates_entry.get(),e_awards_entry.get(),e_firm_entry.get()))
        insert_button.place(x=200, y=385)


def admin_insertemployee(username,password,name,surname,email,exp_years,bio,sistatikes,certificates,awards,firm):


    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if (username == '' or password == '' or name == '' or surname == '' or email == '' or exp_years=='' or  bio == '' or sistatikes == '' or certificates=='' or awards=='' or firm==''):
        messagebox.showerror("Error", "Please fill out the fields to create a new Employee Account!")
    else:
        my_cursor.callproc('admininsert_employee', [username, password, name, surname, email, exp_years, bio, sistatikes, certificates, awards, firm])
        mydb.commit()
        messagebox.showinfo("Information", "The new Employee Account has been created succesfully.")

def admin_insertevaluator(username,password,name,surname,email,exp_years,firm):


    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if (username == '' or password == '' or name == '' or surname == '' or email == '' or exp_years == '' or firm == ''):
        messagebox.showerror("Error", "Please fill out the fields to create a new Evaluator Account!")
    else:
        my_cursor.callproc('admininsert_evaluator', [username, password, name, surname, email, exp_years, firm])
        mydb.commit()
        messagebox.showinfo("Information", "The new Evaluator Account has been created succesfully.")




def admin_insertmanager(username,password,name,surname,email,exp_years,firm):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(username=='' or password=='' or name==''or surname=='' or email=='' or exp_years=='' or firm==''):
        messagebox.showerror("Error","Please fill out the fields to create a new Manager Account!")
    else:
        my_cursor.callproc('admininsert_manager',[username,password,name,surname,email,exp_years,firm])
        mydb.commit()
        messagebox.showinfo("Information","The new Manager Account has been created succesfully.")
    my_cursor.close()
    mydb.close()


def check_radiobuttonsforevaluator():

    if(e.get() == 1):
        eval1=Toplevel()
        eval1.title("Your evaluator file " +  username_entry.get())
        eval1.geometry('500x350')

        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()


        my_cursor.execute('SELECT * FROM user WHERE username=%s', (username_entry.get(),))
        row1 = my_cursor.fetchone()
        print(row1)
        my_cursor.execute('SELECT * FROM evaluator WHERE username=%s', (username_entry.get(),))
        row1 = my_cursor.fetchone()
        print(row1)

        clicktoupdate_button=Button(eval1,text="Click to update",width=20, height=2,command=update_evaluatorfile)
        clicktoupdate_button.pack()


    elif(e.get() == 2):
        eval2 = Toplevel()
        eval2.title("See and update promotion jobs")
        eval2.geometry('500x350')
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()

        my_cursor.callproc('evaluator_seejobpromotions',[username_entry.get(),])
        for result in my_cursor.stored_results():
            print(result.fetchall())

        update_promojobs_button=Button(eval2,text="Update promotion Job",width=20, height=2,command=updatepromojobs)
        update_promojobs_button.pack()

    elif(e.get() == 3):
        eval3 = Toplevel()
        eval3.title("Add a new Promotion Job")
        eval3.geometry('500x350')

        label = Label(eval3, text="Fill out the next fields to add a new Promotion Job.")
        label.pack()

        label_id = Label(eval3, text="Job id:")
        label_id.place(x=10, y=50)

        id_entry = Entry(eval3, width=30)
        id_entry.place(x=110, y=50)

        label_startdate = Label(eval3, text="Start date:")
        label_startdate.place(x=10, y=80)

        startdate_entry = Entry(eval3, width=30)
        startdate_entry.place(x=110, y=80)

        label_salary = Label(eval3 ,text="Salary:")
        label_salary.place(x=10, y=110)

        evalsalary_entry = Entry(eval3, width=30)
        evalsalary_entry.place(x=110, y=110)

        label_position = Label(eval3, text="Position:")
        label_position.place(x=10, y=140)

        position_entry = Entry(eval3, width=30)
        position_entry.place(x=110, y=140)

        label_edra = Label(eval3, text="Edra:")
        label_edra.place(x=10, y=170)

        edra_entry = Entry(eval3, width=30)
        edra_entry.place(x=110, y=170)

        label_submissiondate = Label(eval3, text="Submission date:")
        label_submissiondate.place(x=10, y=200)

        submission_entry = Entry(eval3, width=30)
        submission_entry.place(x=110, y=200)

        label_antikeim_title=Label(eval3,text="Antikeimeno title:")
        label_antikeim_title.place(x=10,y=230)

        antikeim_titleentry=Entry(eval3,width=30)
        antikeim_titleentry.place(x=110,y=230)

        insert_button=Button(eval3,text="Insert", width=10, height=2,command= lambda:insertpromotionjob_eval(id_entry.get(),startdate_entry.get(),evalsalary_entry.get(),position_entry.get(),edra_entry.get(),submission_entry.get(),antikeim_titleentry.get()))
        insert_button.place(x=200, y=290)

    elif(e.get() == 4):
        eval4= Toplevel()
        eval4.title("See and update jobs you have announced.")
        eval4.geometry('500x350')

        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()
        my_cursor.execute('SELECT * FROM job WHERE evaluator=%s',(username_entry.get(),))
        for row in my_cursor:
            print(row)

        update_button=Button(eval4,text="Click here to update",width=20, height=2,command=updatejob_eval)
        update_button.pack()


    elif(e.get() == 5):
        eval5_1=Toplevel()
        eval5_1.title("Plithos Aitisewn gia thesh.")
        eval5_1.geometry('450x300')
        Label(eval5_1, text="").pack()
        Label(eval5_1, text="").pack()
        Label(eval5_1, text="").pack()
        label_id = Label(eval5_1, text="Enter the id of the job:")
        label_id.pack()
        Label(eval5_1, text="").pack()
        id_entry = Entry(eval5_1, width=20)
        id_entry.pack()
        Label(eval5_1, text="").pack()
        Label(eval5_1, text="").pack()
        show_button1 = Button(eval5_1, text="Show number of requests", width=20, height=2, command=lambda :showrequestcount(id_entry.get()))
        show_button1.pack()
        show_button1 = Button(eval5_1, text="Process evaluation data", width=20, height=2,command=lambda: processevaldata(id_entry.get()))
        show_button1.pack()


    elif(e.get() == 6):
         eval6_1=Toplevel()
         eval6_1.title("Evaluation results of a job you announced.")
         eval6_1.geometry('400x250')

         Label(eval6_1, text="").pack()
         Label(eval6_1, text="").pack()
         labeljobid=Label(eval6_1,text="Give the job's id to see the evaluation results: ")
         labeljobid.pack()
         Label(eval6_1, text="").pack()
         jobid_entry=Entry(eval6_1, width=20)
         jobid_entry.pack()
         Label(eval6_1, text="").pack()
         Label(eval6_1, text="").pack()
         showevalresults_button=Button(eval6_1,text="Click to continue",width=20, height=2,command=lambda:showevaluationresults(jobid_entry.get()))
         showevalresults_button.pack()




    elif(e.get() == 7):
        eval7_1=Toplevel()
        eval7_1.title("Jobs in your company")
        eval7_1.geometry('400x350')

        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()
        my_cursor.callproc('jobsinevaluatorscompany',[username_entry.get(),])
        for result7 in my_cursor.stored_results():
            print(result7.fetchall())

        updateajob_button=Button(eval7_1,text="Click to continue",width=20, height=2,command=update_jobannounced)
        updateajob_button.pack()
def processevaldata(id):
    if(id==""):
        messagebox.showerror("Error","Please enter an id.")
    else:
        eval5_2=Toplevel()
        eval5_2.title("Process Evaluation data")
        eval5_2.geometry('400x350')
        label1=Label(eval5_2,text="Confirm the id:")
        label1.pack()
        jobid_entry = Entry(eval5_2, width=20)
        jobid_entry.pack()
        label=Label(eval5_2,text="Give the employee username for this id:")
        label.pack()



        employee_entry=Entry(eval5_2,width=20)
        employee_entry.pack()

        label_aksiologisi1 = Label(eval5_2, text="Aksiologisi1:")
        label_aksiologisi1.place(x=10, y=100)

        aksiologisi1_entry = Entry(eval5_2, width=25)
        aksiologisi1_entry.place(x=100, y=100)

        label_aksiologisi2 = Label(eval5_2, text="Aksiologisi2:")
        label_aksiologisi2.place(x=10, y=120)

        aksiologisi2_entry = Entry(eval5_2, width=25)
        aksiologisi2_entry.place(x=100, y=120)
        label_aksiologisi3 = Label(eval5_2, text="Aksiologisi3:")
        label_aksiologisi3.place(x=10, y=140)

        aksiologisi3_entry = Entry(eval5_2, width=25)
        aksiologisi3_entry.place(x=100, y=140)

        comments_label=Label(eval5_2,text="Comments:")
        comments_label.place(x=10,y=160)

        comments_entry=Entry(eval5_2,width=25)
        comments_entry.place(x=100,y=160)

        Process_button=Button(eval5_2,text="Process Evaluation Data",width=20, height=2,command=lambda :[processevaldata2(aksiologisi1_entry.get(),aksiologisi2_entry.get(),aksiologisi3_entry.get(),comments_entry.get(),employee_entry.get(),jobid_entry.get()),oristikopoihsh(jobid_entry.get(),username_entry.get())])
        Process_button.place(x=130,y=210)

def oristikopoihsh(thesi,evaluator):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    my_cursor.callproc('TelikeskaiOristikopoihmenes_aksiologiseis',[thesi,evaluator])
    for result5_1 in my_cursor.stored_results():
        print(result5_1.fetchall())
    my_cursor.close()
    mydb.close()

def processevaldata2(aksiologisi1,aksiologisi2,aksiologisi3,comments,employee,joid):

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(comments=='' or employee=='' or joid==''):
        messagebox.showerror("Error","Please give some information")
    else:
        my_cursor.execute('Update evaluation set aksiologisi1=%s,aksiologisi2=%s,aksiologisi3=%s,comments=%s WHERE emplusername=%s AND jobid=%s ',[aksiologisi1,aksiologisi2,aksiologisi3,comments,employee,joid])
        mydb.commit()
        messagebox.showinfo("Information","The evaluation data have been inserted succesfully.")
    my_cursor.close()
    mydb.close()

def showrequestcount(id):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(id==""):
        messagebox.showerror("Error","Please enter an id")
    else:
        my_cursor.callproc('showrequestcount',[id])
        for result5 in my_cursor.stored_results():
            print(result5.fetchall())
        my_cursor.close()
        mydb.close()

def update_evaluatorfile():
    eval1_2=Toplevel()
    eval1_2.title("Update your evaluator file.")
    eval1_2.geometry('500x350')

    label = Label(eval1_2, text="Fill out the next fields to update your details.")
    label.pack()

    label_password = Label(eval1_2, text="Password:")
    label_password.place(x=10, y=80)

    passw_entry = Entry(eval1_2, width=30)
    passw_entry.place(x=110, y=80)

    label_name = Label(eval1_2, text="Name:")
    label_name.place(x=10, y=110)

    name_entry = Entry(eval1_2, width=30)
    name_entry.place(x=110, y=110)

    label_surname = Label(eval1_2, text="Surname:")
    label_surname.place(x=10, y=140)

    surname_entry = Entry(eval1_2, width=30)
    surname_entry.place(x=110, y=140)

    label_email = Label(eval1_2, text="Email:")
    label_email.place(x=10, y=170)

    email_entry = Entry(eval1_2, width=30)
    email_entry.place(x=110, y=170)

    label_expyears = Label(eval1_2, text="Experience Years:")
    label_expyears.place(x=10, y=200)

    expyears_entry = Entry(eval1_2, width=30)
    expyears_entry.place(x=110, y=200)

    label_company = Label(eval1_2, text="Company:")
    label_company.place(x=10, y=230)

    company_entry = Entry(eval1_2, width=30)
    company_entry.place(x=110, y=230)

    updatebutton=Button(eval1_2,text="Change details",width=20,height=2,command=lambda :updateevaluatordetails(passw_entry.get(), name_entry.get(),surname_entry.get(),email_entry.get(), expyears_entry.get(),company_entry.get()))
    updatebutton.place(x=150,y=290)

def updateevaluatordetails(password,name,surname,email,expyears,company):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(password=="" or name == "" or surname == "" or email == "" or expyears=="" or company==""):
        messagebox.showerror("Error","Please enter some details to be changed.")
    else:
        my_cursor.execute('Update user set password=%s,name=%s,surname=%s,email=%s WHERE username=%s',(password,name,surname,email,username_entry.get()))
        my_cursor.execute('Update evaluator set exp_years=%s,firm=%s WHERE username=%s',(expyears,company,username_entry.get()))
        mydb.commit()
        messagebox.showinfo("Information","Your evaluator file has been changed succesfully.")
        my_cursor.close()
        mydb.close()


def update_jobannounced():
    eval7_2 = Toplevel()
    eval7_2.title("Update a job you have announced")
    eval7_2.geometry('500x350')
    label = Label(eval7_2, text="Fill out the next fields to update a Job.")
    label.pack()

    label_id = Label(eval7_2, text="Enter the id of the job you want to update:")
    label_id.pack()

    id_entry = Entry(eval7_2, width=20)
    id_entry.pack()

    label_startdate = Label(eval7_2, text="Start date:")
    label_startdate.place(x=10, y=100)

    startdate_entry = Entry(eval7_2, width=30)
    startdate_entry.place(x=110, y=100)

    label_salary = Label(eval7_2, text="Salary:")
    label_salary.place(x=10, y=130)

    evalsalary_entry = Entry(eval7_2, width=30)
    evalsalary_entry.place(x=110, y=130)

    label_position = Label(eval7_2, text="Position:")
    label_position.place(x=10, y=170)

    position_entry = Entry(eval7_2, width=30)
    position_entry.place(x=110, y=170)

    label_edra = Label(eval7_2, text="Edra:")
    label_edra.place(x=10, y=200)

    edra_entry = Entry(eval7_2, width=30)
    edra_entry.place(x=110, y=200)

    label_submissiondate = Label(eval7_2, text="Submission date:")
    label_submissiondate.place(x=10, y=230)

    submission_entry = Entry(eval7_2, width=30)
    submission_entry.place(x=110, y=230)

    update_button=Button(eval7_2,text="Update",width=10, height=2,command= lambda :changejob_eval(id_entry.get(),startdate_entry.get(),evalsalary_entry.get(),position_entry.get(),edra_entry.get(),submission_entry.get()))
    update_button.place(x=176,y=270)




def showevaluationresults(jobid):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    my_cursor.callproc('oristikopoihmenes_aksiologhseis',[jobid,])
    mydb.commit()
    for result6 in my_cursor.stored_results():
        print(result6.fetchall())

    my_cursor.close()
    mydb.close()

def updatepromojobs():
    eval2_1=Toplevel()
    eval2_1.title("Update promotion jobs you have announced.")
    eval2_1.geometry('500x350')

    label = Label(eval2_1, text="Fill out the next fields to update a Promotion Job.")
    label.pack()

    label_id = Label(eval2_1, text="Enter the id of the Promotion Job you want to update:")
    label_id.pack()

    id_entry = Entry(eval2_1, width=20)
    id_entry.pack()

    label_startdate = Label(eval2_1, text="Start date:")
    label_startdate.place(x=10, y=100)

    startdate_entry = Entry(eval2_1, width=30)
    startdate_entry.place(x=110, y=100)

    label_salary = Label(eval2_1, text="Salary:")
    label_salary.place(x=10, y=130)

    evalsalary_entry = Entry(eval2_1, width=30)
    evalsalary_entry.place(x=110, y=130)

    label_position = Label(eval2_1, text="Position:")
    label_position.place(x=10, y=170)

    position_entry = Entry(eval2_1, width=30)
    position_entry.place(x=110, y=170)

    label_edra = Label(eval2_1, text="Edra:")
    label_edra.place(x=10, y=200)

    edra_entry = Entry(eval2_1, width=30)
    edra_entry.place(x=110, y=200)

    label_submissiondate = Label(eval2_1, text="Submission date:")
    label_submissiondate.place(x=10, y=230)

    submission_entry = Entry(eval2_1, width=30)
    submission_entry.place(x=110, y=230)

    update_button=Button(eval2_1,text="Update",width=10, height=2,command= lambda :changepromojob_eval(id_entry.get(),startdate_entry.get(),evalsalary_entry.get(),position_entry.get(),edra_entry.get(),submission_entry.get()))
    update_button.place(x=176,y=270)

def changepromojob_eval(id,startdate,salary,position,edra,submission):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if (id == '' or startdate == '' or salary == '' or position == '' or edra == '' or submission == ''):
        messagebox.showerror("Error", "Please fill out the fields to update a Promotion Job you have announced!")
    else:
        my_cursor.callproc('evaluator_updatejobpromotion',[id,startdate,salary,position,edra,username_entry.get(),submission])
        mydb.commit()
        messagebox.showinfo("Information","The Promotion Job has been updated succesfully.")
        my_cursor.close()
        mydb.close()

def updatejob_eval():
    eval4_1=Toplevel()
    eval4_1.title("Update jobs you have announced.")
    eval4_1.geometry('500x350')

    label = Label(eval4_1, text="Fill out the next fields to update a Job.")
    label.pack()

    label_id = Label(eval4_1, text="Enter the id of the job you want to update:")
    label_id.pack()

    id_entry = Entry(eval4_1, width=20)
    id_entry.pack()

    label_startdate = Label(eval4_1, text="Start date:")
    label_startdate.place(x=10, y=100)

    startdate_entry = Entry(eval4_1, width=30)
    startdate_entry.place(x=110, y=100)

    label_salary = Label(eval4_1, text="Salary:")
    label_salary.place(x=10, y=130)

    evalsalary_entry = Entry(eval4_1, width=30)
    evalsalary_entry.place(x=110, y=130)

    label_position = Label(eval4_1, text="Position:")
    label_position.place(x=10, y=170)

    position_entry = Entry(eval4_1, width=30)
    position_entry.place(x=110, y=170)

    label_edra = Label(eval4_1, text="Edra:")
    label_edra.place(x=10, y=200)

    edra_entry = Entry(eval4_1, width=30)
    edra_entry.place(x=110, y=200)

    label_submissiondate = Label(eval4_1, text="Submission date:")
    label_submissiondate.place(x=10, y=230)

    submission_entry = Entry(eval4_1, width=30)
    submission_entry.place(x=110, y=230)

    update_button=Button(eval4_1,text="Update",width=10, height=2,command= lambda :changejob_eval(id_entry.get(),startdate_entry.get(),evalsalary_entry.get(),position_entry.get(),edra_entry.get(),submission_entry.get()))
    update_button.place(x=176,y=270)

def changejob_eval(id,startdate,salary,position,edra,submissiondate):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )


    my_cursor = mydb.cursor()
    if ( id == '' or startdate == '' or salary == '' or position == '' or edra == '' or submissiondate == ''):
        messagebox.showerror("Error", "Please fill out the fields to update a job you have announced!")
    else:
        my_cursor.callproc('updatejobs_youhaveannounced',[id,startdate,salary,position,edra,username_entry.get(),submissiondate])
        mydb.commit()
        messagebox.showinfo("Information","The job has been updated succesfully.")
        my_cursor.close()
        mydb.close()



def insertpromotionjob_eval(id,startdate,salary,position,edra,submissiondate,antikeimtitle):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(id=='' or startdate=='' or salary=='' or position=='' or edra=='' or submissiondate=='' or antikeimtitle==''):
        messagebox.showerror("Error","Please fill out the fields to insert a promotion job!")
    else:
        my_cursor.callproc('insertjobpromotion',[id,startdate,salary,position,edra,username_entry.get(),submissiondate,antikeimtitle])
        mydb.commit()
        messagebox.showinfo("Information","The new job promotion has been inserted succesfully.")
        my_cursor.close()
        mydb.close()


def check_radiobuttonsformanager():

    if(r.get() == 1):
        top1=Toplevel()
        top1.title("Change company's details")
        top1.geometry("450x320")

        label1 = Label(top1,text="Enter the details to be changed:").pack()

        Label(top1, text="").pack()
        Label(top1, text="").pack()
        label_phone = Label(top1,text="Phone:")
        label_phone.place(x=10,y=50)
        phone_entry = Entry(top1,width=25)
        phone_entry.place(x=70,y=50)
        print(phone_entry.get())

        label_street = Label(top1, text="Street:")
        label_street.place(x=10,y=80)


        street_entry = Entry(top1, width=25)
        street_entry.place(x=70,y=80)
        label_num = Label(top1, text="Number:")
        label_num.place(x=10,y=110)

        num_entry = Entry(top1, width=25)
        num_entry.place(x=70,y=110)
        label_city = Label(top1, text="City:")
        label_city.place(x=10,y=140)

        city_entry = Entry(top1, width=25)
        city_entry.place(x=70,y=140)
        label_country = Label(top1, text="Country:")
        label_country.place(x=10,y=170)

        country_entry = Entry(top1, width=25)
        country_entry.place(x=70,y=170)
        Label(top1, text="").pack()

        change_button =Button(top1,text="Change",width=10,height=2,command=lambda :manager_change_companydetails(phone_entry.get(),street_entry.get(), num_entry.get(), city_entry.get(),country_entry.get()))
        change_button.place(x=190,y=220)

    elif(r.get() == 2):
        top2=Toplevel()
        top2.title("Change your password and email.")
        top2.geometry("400x250")

        label1 = Label(top2, text="Enter the details to be changed:").pack()

        label_password = Label(top2, text="Password:")
        label_password.place(x=10, y=80)
        pass_entry = Entry(top2, width=25)
        pass_entry.place(x=100, y=80)

        label_email = Label(top2, text="Email:")
        label_email.place(x=10, y=110)
        email_entry = Entry(top2, width=25)
        email_entry.place(x=100, y=110)

        change_button=Button(top2,text="Click to update",width=20,height=2,command=lambda:updatemang_passandemail(pass_entry.get(),email_entry.get()))
        change_button.place(x=120,y=180)


    elif(r.get() == 3):
        top3 = Toplevel()
        top3.title("Change salary of a job")
        top3.geometry("400x270")
        top3.iconbitmap("C:/Users/dorak/Downloads/money.ico")
        label3=Label(top3,text="Give the id of the promotion job and then enter the new salary:")
        label3.pack()
        Label(top3, text="").pack()
        Label(top3, text="").pack()
        label_id = Label(top3, text="Promotion Job ID:")
        label_id.pack()
        entry_id = Entry(top3, width=25)
        entry_id.pack()
        Label(top3, text="").pack()
        label_salary = Label(top3,text="Salary:")
        label_salary.pack()
        entry_salary = Entry(top3, width=25)
        entry_salary.pack()
        Label(top3, text="").pack()
        Label(top3, text="").pack()

        update_button= Button(top3,text="Click to update salary",width=20,height=2,command=lambda :manager_update_salary( entry_id.get(),entry_salary.get()))
        update_button.pack()


    elif(r.get() == 4):
        top4 = Toplevel()
        top4.title("Evaluation Results for fully evaluated jobs")
        top4.geometry("500x350")

        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()




        my_cursor.callproc('emfaniseapotelesmataston_manager', [username_entry.get()])
        for result in my_cursor.stored_results():
            print(result.fetchall())



        mydb.commit()
        my_cursor.close()
        mydb.close()






    elif(r.get() == 5):
        top5 = Toplevel()
        top5.title("Average grade per evaluator in company")
        top5.geometry("500x350")
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()
        my_cursor.callproc('emfanise_averagevathmo_anaevaluator',[username_entry.get()])
        print("Average Evaluation Grade per evaluator in your company:")
        for apotelesma5 in my_cursor.stored_results():
            print(apotelesma5.fetchall())
        my_cursor.close()
        mydb.close()






    elif(r.get() == 6):
        top6 = Toplevel()
        top6.title("Show and update employee details")
        top6.geometry("500x350")

        mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
        )

        my_cursor = mydb.cursor()

        my_cursor.callproc('emfanisefakeloemployee',[username_entry.get(),])
        for apotelesma in my_cursor.stored_results():
            print(apotelesma.fetchall())


        updateemployee_button = Button(top6,text="Click here to update \n employee's file",width=20,height=3,command=manag_update_employeefile)
        updateemployee_button.pack()



    elif(r.get() == 7):
        top7 = Toplevel()
        top7.title("Requests,evaluations and evaluators per employee")
        top7.geometry("400x250")
        Labl = Label(top7,text="Please fill out the next fields.").pack()
        Label(top7, text="").pack()
        Label(top7, text="").pack()
        emplname_lbl = Label(top7,text="Name:")
        emplname_lbl .pack()
        emplname_entry = Entry(top7,width=25)
        emplname_entry.pack()
        Label(top7, text="").pack()

        emplsurname_lbl = Label(top7,text="Surname:")
        emplsurname_lbl.pack()
        emplsurname_entry = Entry(top7,width=25)
        emplsurname_entry.pack()

        Label(top7, text="").pack()
        continue_bton = Button(top7,text="Continue",width=10,height=1,command=lambda :manager_open_windowrequests(emplname_entry.get() ,emplsurname_entry.get() ))
        continue_bton.pack()


def updatemang_passandemail(password,email):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(password=="" or email==""):
        messagebox.showerror("Error","Please enter some information.")
    else:
        my_cursor.execute('UPDATE user SET password=%s , email=%s WHERE username=%s',(password,email,username_entry.get()))
        mydb.commit()
        messagebox.showinfo("Information","Your password and email have been changed succesfully.")
        my_cursor.close()
        mydb.close()

def manag_update_employeefile():
    new_window=Toplevel()
    new_window.title("Update employee's file")
    new_window.geometry("400x350")
    labelup=Label(new_window,text="Enter the employee's username whose file you want to update: ")
    labelup.pack()
    empl_en=Entry(new_window,width=20)
    empl_en.pack()
    label_sistatikes= Label(new_window,text="Sistatikes:")
    label_sistatikes.place(x=10,y=80)
    sistatikes_entry=Entry(new_window,width=25)
    sistatikes_entry.place(x=90,y=80)
    label_certificates=Label(new_window,text="Certificates:")
    label_certificates.place(x=10,y=120)
    certificates_entry=Entry(new_window,width=25)
    certificates_entry.place(x=90,y=120)
    label_awards=Label(new_window,text="Awards:")
    label_awards.place(x=10,y=160)
    awards_entry=Entry(new_window,width=25)
    awards_entry.place(x=90,y=160)


    change_employeefilebutton=Button(new_window,text="Change",width=10,height=2,command=lambda :manager_change_employefile(empl_en.get(),sistatikes_entry.get(),certificates_entry.get(),awards_entry.get()))
    change_employeefilebutton.place(x=170,y=220)



def manager_change_employefile(employee,sistatikes,certificates,awards):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()
    if(employee=='' or sistatikes=='' or certificates=='' or awards==''):
        messagebox.showerror("Error","Please fill out the fields!")
    else:
        my_cursor.callproc('allaksestoixeiaemployee',[username_entry.get(),employee,sistatikes,certificates,awards])
        mydb.commit()
        messagebox.showinfo("Information", "This employee's file has been updated succesfully.")




def manager_open_windowrequests(employeename, employeesurname):

    if(employeename == "" or employeesurname == ""):
        messagebox.showerror("Error","Please enter a name and surname for employee.")
    else:
        window_em = Toplevel()
        window_em.title("Requests, evaluations and evaluators per employee")
        window_em.geometry("550x450")


        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Dora123krem",
            database="staffevaluation"
        )

        my_cursor = mydb.cursor()
        my_cursor.callproc('aitiseis_aksiologiseis_evaluatorOfEmployee',[employeename,employeesurname])
        for result1 in my_cursor.stored_results():
            print(result1.fetchall())




def manager_update_salary(promjob_id,salary):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Dora123krem",
        database="staffevaluation"
    )

    my_cursor = mydb.cursor()

    if(salary == ""):
        messagebox.showerror("Error","Please enter a new salary.")
    else:
        my_cursor.callproc('syndesimisthos_manager1', [username_entry.get(),promjob_id,salary])
        mydb.commit()
        messagebox.showinfo("Information","The promotion job's salary has been updated.")



    my_cursor.close()
    mydb.close()


def manager_change_companydetails(phone,street,num,city,country):

                mydb = mysql.connector.connect(
                host="localhost",
                user="root",
                password="Dora123krem",
                database="staffevaluation"
            )

                my_cursor = mydb.cursor()

                if(phone == '' and street == '' and num == '' and city=='' and country == ''):
                    messagebox.showerror("Error","Please enter company details to be changed!")
                else:
                    my_cursor.callproc('syndesicompanyupdate',[username_entry.get(),phone,street,num,city,country])

                    mydb.commit()
                    messagebox.showinfo("Details changed","Your company's phone,street,number,city "
                                                          "and country have been changed succesfully.")


                my_cursor.close()
                mydb.close()


def check():

    username = username_entry.get()
    password = password_entry.get()


    if(username == "" or password == ""):
        messagebox.showerror("Error","All fields are required!")
    else:
        try:
            mydb = mysql.connector.connect(
                host="localhost",
                user="root",
                password="Dora123krem",
                database="staffevaluation"
            )

            my_cursor = mydb.cursor()




            my_cursor.execute("SELECT * FROM user WHERE username=%s AND password=%s",(username_entry.get(),password_entry.get()))
            row=my_cursor.fetchone()

            if row==None:
               messagebox.showerror("Error","Login failed, Invalid Username or Password. Try again!")
            else:
               messagebox.showinfo("Login Success"," Welcome " + username_entry.get()+"!")

        except Exception as es:
            messagebox.showerror("Error", "Error Due to "+ str(es))

        my_cursor.close()
        mydb.close()




global emplname_entry
global emplsurname_entry
global phone_entry
global street_entry
global num_entry
global city_entry
global country_entry

global username_entry
global password_entry
global entry_salary



username_lbl = Label(root,text="Username:").pack()
username_entry = Entry(root,width=20)
username_entry.pack()
Label(root,text="").pack()

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Dora123krem",
    database="staffevaluation"
)

my_cursor = mydb.cursor()

my_cursor.callproc('paretousername', [username_entry.get()])
mydb.commit()



my_cursor.close()
mydb.close()

password_lbl = Label(root,text="Password:").pack()
password_entry = Entry(root,width=20, show = "*")
password_entry.pack()
Label(root,text="").pack()

login_button = Button(root,text="Log In",width=9,height=2, command=lambda:[check(),seperate_users()])
login_button.place(x=155,y=190)

quit_button = Button(root,text="Quit",width=9,height=2,command=root.quit)
quit_button.place(x=65,y=190)




root.mainloop()