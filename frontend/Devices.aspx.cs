using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class Devices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String t = (Session["usertype1"]) as string;
            if (t == "Guest")
            {
                addbutton1.Visible = false;
                loc.Visible = false;
                batterybutton.Visible = false;
                getbutton.Visible = false;
            }



            SqlCommand devicesinfo = new SqlCommand("devicesinfo", conn);
            devicesinfo.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader rdr = devicesinfo.ExecuteReader();
            int deviceCount = 0;

            PlaceHolder infoPlacehold = FindControl("infoPlacehold") as PlaceHolder;

            if (infoPlacehold != null)
            {
                while (rdr.Read())
                {
                    Panel devicePanel = new Panel();
                    devicePanel.CssClass = "device-info";

                    // deviceid
                    int deviceidIndex = rdr.GetOrdinal("device_id");
                    string deviceid = rdr.IsDBNull(deviceidIndex) ? string.Empty : rdr.GetInt32(deviceidIndex).ToString();

                    // type
                    string type = rdr.IsDBNull(rdr.GetOrdinal("type")) ? string.Empty : rdr.GetString(rdr.GetOrdinal("type"));

                    if (!string.IsNullOrEmpty(deviceid) && !string.IsNullOrEmpty(type))
                    {
                        Label deviceLabel = new Label();
                        deviceLabel.Text = $"Device id: {deviceid} | Type: {type} <br />";
                        devicePanel.Controls.Add(deviceLabel);
                        infoPlacehold.Controls.Add(devicePanel);
                    }

                    deviceCount++;
                }
            }

            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int deviceid = 0;

            try
            {
                deviceid = int.Parse(TextBox1.Text);
            }
            catch (FormatException ex)
            {
                output1.Text = ($"An error occurred: {ex.Message}");
                return;
            }
            catch (SqlException ex)
            {
                output1.Text = $"An error occurred: {ex.Message}";
                return;
            }

            SqlCommand viewc = new SqlCommand("ViewMyDeviceCharge", conn);
            viewc.CommandType = CommandType.StoredProcedure;

            viewc.Parameters.Add(new SqlParameter("@device_id", deviceid));

            conn.Open();

            SqlDataReader rdr = viewc.ExecuteReader();

            System.Text.StringBuilder result = new System.Text.StringBuilder();

            while (rdr.Read())
            {
                int batteryStatusIndex = rdr.GetOrdinal("battery_status");
                string batterystatus = rdr.IsDBNull(batteryStatusIndex) ? string.Empty : rdr.GetInt32(batteryStatusIndex).ToString();

                if (!string.IsNullOrEmpty(batterystatus))
                {
                    result.AppendLine($"Device's charge = {batterystatus}");
                }
                else
                {
                    result.AppendLine("Incorrect device id entered");
                }
            }


            output1.Text = result.ToString();

            conn.Close();
        }

        protected void addbutton1_Click(object sender, EventArgs e)
        {
            add1.Visible = true;
            add2.Visible = true;
            add3.Visible = true;
            add4.Visible = true;
            add5.Visible = true;
            addbutton2.Visible = true;
            output2.Visible = true;
        }

        protected void addbutton2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int device_id = 0;
            try
            {
                device_id = int.Parse(add1.Text);
            }
            catch (FormatException ex)
            {
                output2.Text = ($"An error occurred: {ex.Message}");
                return;
            }
            string status = add2.Text;
            int battery = int.Parse(add3.Text);
            int location = int.Parse(add4.Text);
            string type = add5.Text;

            if (status == "" || battery == 0 || location == 0 || type == "")
            {
                output2.Text = "Failed to add device. info is missing";
                return;
            }

            SqlCommand AddDevice = new SqlCommand("AddDevice", conn);
            AddDevice.CommandType = CommandType.StoredProcedure;

            AddDevice.Parameters.Add(new SqlParameter("@device_id", device_id));
            AddDevice.Parameters.Add(new SqlParameter("@status", status));
            AddDevice.Parameters.Add(new SqlParameter("@battery", battery));
            AddDevice.Parameters.Add(new SqlParameter("@location", location));
            AddDevice.Parameters.Add(new SqlParameter("@type", type));



            try
            {
                conn.Open();
                int rowsAffected = AddDevice.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    output2.Text = "Device added successfully.";
                }
                else
                {
                    output2.Text = "Failed to add device.";
                }
            }
            catch (SqlException ex)
            {
                Response.Write($"An error occurred: {ex.Message}");
            }





        }

        protected void loc_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand OutOfBattery = new SqlCommand("OutOfBattery", conn);
            OutOfBattery.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader rdr = OutOfBattery.ExecuteReader();
            HashSet<int> uniqueRooms = new HashSet<int>();

            while (rdr.Read())
            {
                int loc = rdr.GetInt32(rdr.GetOrdinal("room"));
                uniqueRooms.Add(loc);
            }

            conn.Close();

            if (uniqueRooms.Count > 0)
            {
                string roomsOutOfBattery = string.Join(", ", uniqueRooms);
                loclabel.Text = "Rooms with devices out of battery: " + roomsOutOfBattery;
            }
            else
            {
                loclabel.Text = "No rooms have devices with dead battery.";
            }
        }

        protected void batterybutton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand Charging = new SqlCommand("Charging", conn);
            Charging.CommandType = CommandType.StoredProcedure;

            conn.Open();

            int rowsAffected = Charging.ExecuteNonQuery();

            conn.Close();

            if (rowsAffected > 0)
            {
                batterylabel.Text = "Devices out of battery are now charging.";
            }
            else
            {
                batterylabel.Text = "No devices were out of battery ";

            }
        }

        protected void getbutton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand NeedCharge = new SqlCommand("NeedCharge", conn);
            NeedCharge.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader rdr = NeedCharge.ExecuteReader();

            string roomsOutOfBattery = "";

            while (rdr.Read())
            {
                int loc = rdr.GetInt32(rdr.GetOrdinal("room"));
                roomsOutOfBattery += loc + ", ";
            }

            conn.Close();
            roomsOutOfBattery = roomsOutOfBattery.TrimEnd(',', ' ');
            getlabel.Text = "Rooms with more than 2 devices out of battery: " + roomsOutOfBattery;
            }

        }
    }
    


