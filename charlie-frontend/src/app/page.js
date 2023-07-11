"use client";
import React, { useState } from "react";
import Menu from "./menu";
import useSWR from "swr";
import axios from "axios";

export default function Home() {
  const fetcher = (...args) => fetch(...args).then((res) => res.json());

  const [user, setUser] = useState("1");
  const [users, setUsers] = useState([]);
  const { data, error, isLoading } = useSWR(
    `http://localhost:3000/api/v1/users/${user}/menu`,
    fetcher
  );

  React.useEffect(() => {
    axios.get("http://localhost:3000/api/v1/users").then((response) => {
      setUsers(response.data);
    });
  }, []);

  if (error) return <div>failed to load</div>;
  if (isLoading) return <div>loading...</div>;

  return (
    <div className="flex min-h-screen flex-col items-center justify-between p-24 bg-white">
      <form>
        <select value={user} onChange={(e) => setUser(e.target.value)}>
          {users.map((user) => (
            <option key={user.id} value={user.id}>
              {user.first_name} - DOB: {user.dob} - Employment start:{" "}
              {user.employment_started_at}
            </option>
          ))}
        </select>
      </form>
      <div className="absolute bottom-0 right-0">
        <Menu data={data} />
      </div>
    </div>
  );
}
