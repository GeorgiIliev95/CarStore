using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using CarDatabaseTesting.Models;

namespace CarDatabaseTesting.ViewModels
{
    public class ClientVM
    {
        public ClientVM(int id, string firstName, string lastName, DateTime birthdate, string email, string phonenumber)
        {
            this.ID = id;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.BirthDate = birthdate;
            this.Email = email;
            this.TelephoneNumber = phonenumber;
        }

        public ClientVM(Client client)
        {
            this.ID = client.ID;
            this.FirstName = client.FirstName;
            this.LastName = client.LastName;
            this.BirthDate = client.BirthDate;
            this.Email = client.Email;
            this.TelephoneNumber = client.TelephoneNumber;
        }

        public int ID { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }

        [Display(Name = "Birthdate")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime BirthDate { get; set; }
        public string Email { get; set; }
        public string TelephoneNumber { get; set; }

        public string FullNameAndPhone
        {
            get
            {
                return string.Format("{0} {1} {2}", FirstName, LastName, TelephoneNumber);
            }
        }
    }
}