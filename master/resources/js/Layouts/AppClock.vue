<template>
    <div class="app-clock">
        <h6>
            {{ date.dayWeek }},<span> {{ date.day }} {{ date.monthYear }}</span>
        </h6>
        <h4>{{ date.hour }}</h4>
    </div>
</template>

<script>
export default {
    data() {
        return {
            date: {
                day: "",
                monthYear: "",
                dayWeek: "",
                hour: ""
            }
        };
    },

    created() {
        this.getDate();
    },
    methods: {
        getDate() {
            const days = [
                "Sunday",
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday"
            ];
            const months = [
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December"
            ];

            const updateHour = () => {
                const date = new Date();
                this.date.day = date.getDate();
                this.date.monthYear = `De ${
                    months[date.getMonth()]
                } de ${date.getFullYear()}`;
                this.date.dayWeek = days[date.getDay()];
                this.date.hour = date.toLocaleTimeString();
            };

            setInterval(updateHour, 1000);
        }
    }
};
</script>

<style lang="scss" scoped>
.app-clock {
    color: #fff;
    padding: 15px;
    height: 100%;
    background: #0c1821;
    // text-align: left
}
</style>
